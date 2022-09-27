Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A65ECEFB
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:55:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664312101;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8BmmZ0m9z6muFx5Iy7DlnCsRw6Pv4AU0H6uZ9v1nG/c=;
	b=PtrT/r+ENRLblx7rGPSl1uR1oe86K2EsDhqWu6cuSe0NMyb5gqQd6jwZcOOMOlogZUBorO
	mjvDDcADKKBVyj+sP3DvpIkLHz3NzO5Gf6upkT3pFBB1VUvEKsqYtOqZ6iz+4/CE2KaiAn
	mG90qg+7ViXtKvD0LIxxxtaeIAeqVuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-rndjkYrXNAOGDdZNdqPuwA-1; Tue, 27 Sep 2022 16:54:59 -0400
X-MC-Unique: rndjkYrXNAOGDdZNdqPuwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F0F87B2A0;
	Tue, 27 Sep 2022 20:54:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D06F17583;
	Tue, 27 Sep 2022 20:54:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E6411946A48;
	Tue, 27 Sep 2022 20:54:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 334851946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:54:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 060D0C15BA5; Tue, 27 Sep 2022 20:54:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F333AC15BA4
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:54:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A148027FE
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:54:51 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
 (sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-226-3SQh1N_-M2ezA12RBJCCmg-1; Tue,
 27 Sep 2022 16:54:49 -0400
X-MC-Unique: 3SQh1N_-M2ezA12RBJCCmg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664312087; bh=m6oLV7Huf4LAiNg3ALTDW14ukEmJMvrB4LIaHcLio5A=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=JVCfem15u9LYfg4ulQuGw7AXodo1Ra2K8zGeShNwjVTGYMS8dM2TDJqc4tscThEx+QjPkf3zyQ13dG8brGz/Yh/Gv9VitrshDvymx6gmhfTx8AmYCFY86j+VkGxNXHruyxMst1fSDY3vbOQQXXxHbuCKYvyVsmWtX19NSlyKkBnasWxmnvQ3XSqNAcdI3/3VcymXd80j7SZgXJEUjTsuW7b6oZbeY8I9FsX7oKbwTOKqi8ClDjyYpTCED/wA3RJijD30ZMsGmsiYfcJoCOvpVJqh2dWKXvny+hXadU2vHVq6nXmDa3oDkHgYKAOgGHWiKv3nxSFXtBBiav6yOfUNew==
X-YMail-OSG: jB7WtT0VM1ltgsSoQlpJ6Nb_nKLEjsT78ByBKsDkbBSeZd2KtM.Z72lUbJpa_73
 ToNubpErIwiaSTtmrDFj99oZp3Z0RqMjnWZb0sES6dE19qzTWDfmNO0I_0VuGgasZGolCASfNUPP
 NdEr3VDWJfvYHvwLdqaL3HwqurM4KvFloo4txNW4UmYBEFat4Ho5wYc6SiQh5X2Gjt9lXjNDThk3
 kBVbWYWBfWiUV3g802tHgVpHBFbape4n6p5pRk0_OtZ3V.8d9UdEBPzn_1ivzTxx3P_MRCbTUalF
 BtoVPFts3hpqiYgx0cB2JSO9qevqQIKo.Vg_W1mJfGjHrFbwSb4VS9YBLtqk4vk9QoxRVaAtRRuw
 ezUEDuEiZ0HQjgKaUs2iT.0EJ0buqGSy81vCbfwJOh.Z8ER8PWPjsJj8O7_SJ2WhTOTo69ba9m9p
 jLccN59xsJnm.A.ZCDz0m67PIzAmTt9d1gM5H0qx5xaaEKcU06ynD4L8RnRrJqYqqp9uzf7C1xjG
 7t3jD5Uu2N5sLtg3yM9Ezrkev2FogAQEK.EEGwDMtM9vLmvEUfFfEjgWHFjz3e4qLUs89IIaGI5h
 dOwbqH4IGg1hvQQydw.7RLVCXB6SEsoWgALIToS3qNJYcaarRTp7hYaJZ9.v4hDjtIk5YcEXzTDs
 Vn8BGroVx3wEeTfXSnUQk6uuhc0q0JTh75m5kardmS3bCQQqSzXkkHS0l6g85O.ckb_yr7WB8MBS
 ScWxtJc92ExGefhlqxQaoWr0cpIETuYi5DgU8zXrln3ptgzF4T_j66ltyvUdBbl4sR_FM9dQQWtz
 lzvkER4WHerfUa105P3uiMqNdSpCpMd2nXeESJh4FCeiPfS2vGcta4aEV8ogGGh_dPsHVgbD3hFu
 j3fhdf6sWwTlI7qr0USuQsWLRzWNQ6O6QsubyFjTFvDwTqsLz.latsUW_COEdQ.t6IgED_RiG37p
 i4hvtjRESIlS6qSlzeFUX22daQerKWk4OGlpFFpgbgFjWSaXQRHOVMtgYRA6UjkjqbIT8WQ1bDu4
 1D1nD.pvsGxFNCvFe25JiTHemL3PK2clq7wJTvMU5VuF.eXmwZYSCQtHvBSMv.gYPI7e1LNNf9O9
 NL0At4CrBmpActivp5az8olLuDFw6LOfiC2xA4SdjFZKd5Gb4Rwl1OAZJqTe3V3yKcgLuYEYy_vx
 RCc_uvf9bHIs.WFyBhig1FvtO7OfIo0vrojASHlwE6hQc78kWV0GZvUqUjdKYPJxhxt_dJwXH0uL
 Ta_3qEF.ZP5PaEKU7Vdcs9.tcG9ARTy1rX1f2g5uOP2lf1N6uI2gY6SKhRK1GXbtCx1kdcTio35j
 imeIteAhYJR36GTAghk6j_D.ygAW2JvYackX7luUOUdxoWg8mi5k924ySzRONdbvPTU6oY9Vb4Hw
 K3rr85B5Wc0Jv8ZXyzt1jYdBTfvP0mU9rBYu8bC6trEUSyiVXD5qH.aDaan69DoiNCq9JI4rzuVj
 PIQLptU8u_SZsEwkz8luhly8RS1d7SrPSaaNYLXpFKFFBl3Ul4dSHYY_OicZB_b2NtA097QmD2_M
 BWyD_GFeL13faOILKtm0L75HkRlQLhZFcRbxfI6rZlrS6adb4jHP5mco9Xjaxcw.YgDKLNWT9_J7
 A7Hf57T04_0lwrlQB0VUw683DIQ9KAg6j0mwW0jFWscPHP5KsENnm1v2vV8IFguVGlrK1b_P2GPn
 1m8Z1BwK50lTONfp9zMt_da2GoMwu4i4sNjta5Zux6hxN4QvGxeguiSOivFSZiT1rQrV2ZkoSgy5
 nSbfDQUC3OGVbWHu3nu6DOBbnPuaxOtYhZ1xkuPxkDCP_LaTJW2wQbEaJo2d8p_Oh9OkqhIkOIo5
 cciHNpcRsXL2wKutaSFRK1_HGyzo1V5thc8mJhHTVEyrWBiyZaHOaJ0wgfSx01Ucn3ySu7xEFTBn
 Yv5dXRgiMcIYOR1a26MZYPJwyqejnq66fT2ft.XCDOrfAVvnb8eMyC66jJKv7gYiY6pWEgOIleFd
 agQwYbXbhtde9Xk4xrWMugdTV7DBVwyXdicawzZFDHiIDCNt6bEGEBPg5Ywh4D_WA0leLjFmtZbF
 Vnd2HBbvXj7EUuiqY5y2ObM_9LrLaj96gf4.FiZhiwnQAyR3EarJM5AtxeFa7rtQnWW6APaJQGdD
 VKrzUuHKusGeUwEfbmBQ2wUmnOl5FFaiCqC6JYoNYYZK42guCG7hvwpAk7bwKE.0yW6YNXOSuOvf
 UgslwZMLh3GcZ3EBQGPrDZ6oC59os.MW5q0e7Swsux4N1aWuNLyEMxVM4QDFfpjGdYL6iORZvKbl
 fgMsbWI8v3Enpq2wVWKjHYKM-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:54:47 +0000
Received: by hermes--production-bf1-759bcdd488-g2m8t (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c0f7fbfb612a7787fa755968879301d1; 
 Tue, 27 Sep 2022 20:54:46 +0000 (UTC)
Message-ID: <e53a88aa-8fe9-0e0f-ae41-0df17df86a77@schaufler-ca.com>
Date: Tue, 27 Sep 2022 13:54:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: LSM stacking in next for 6.1?
To: Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <CAHC9VhSF8hWg=7tbFiCrizNF61vpwJcU3793LcStiu-anW4i1g@mail.gmail.com>
 <CAHC9VhTDGwO789t59EyOV0SwnwGrdyBhRiuJpoY7cB4MSe02BQ@mail.gmail.com>
 <e2b6ae44-1037-666f-5012-6abd4d46c0b7@schaufler-ca.com>
 <CAHC9VhQ+UcJw4G=VHNE8wMa+EBG-UcoZ7ox0vNqLHoSKAd9XZQ@mail.gmail.com>
 <269014c6-5ce6-3322-5208-004cb1b40792@canonical.com>
 <CAHC9VhRrOgDMO9fo632tSL7vCMAy1_x3smaAok-nWdMAUFB8xQ@mail.gmail.com>
 <1958a0d3-c4fb-0661-b516-93f8955cdb95@schaufler-ca.com>
 <CAHC9VhQPvcunvBDvSnrUChwmGLen0Rcy8KEk_uOjNF1kr4_m9w@mail.gmail.com>
 <6552af17-e511-a7d8-f462-cafcf41a33bb@schaufler-ca.com>
 <CAHC9VhQMeyxQJSAUuigu=CCr44WtpJg=LEh1xng_bPfCCjqq6Q@mail.gmail.com>
 <5ef4a1ae-e92c-ca77-7089-2efe1d4c4e6d@schaufler-ca.com>
 <CAHC9VhQRpeOMkeEfy=VRPnpuYMUDYgLp56OjQZPYwoXmfHYREQ@mail.gmail.com>
 <c679cea7-bb90-7a62-2e17-888826857d55@schaufler-ca.com>
 <CAHC9VhQ-FqURHeuq_3YNH8NixJiGZ9bEEdydu49kC5tLan+FoA@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHC9VhQ-FqURHeuq_3YNH8NixJiGZ9bEEdydu49kC5tLan+FoA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: John Johansen <john.johansen@canonical.com>,
 SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/14/2022 6:42 AM, Paul Moore wrote:
> On Thu, Sep 8, 2022 at 6:56 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> I am going to start playing with these syscalls. Please help me understand
>> where I have suggested something stoopid.
> Thanks for posting an initial patch that we can use for further
> discussion.  Time is a bit tight this week due to LPC/LSS-EU so I'm
> not sure I'll have the time to provide any meaningful comments, but if
> nothing else it's on my todo list for next week.

With a full understanding that the 6.1 boat has not only sailed but has
subsequently been sunk by pirates I've posted my v38 stacking patches.
I would have liked to wait for some amount of "discussion" on the proposed
syscalls and prctl() options before posting, but it seems that isn't
going to happen on its own. In spite of the radical change to the user
interface I am pushing for -next for 6.2. If there has to be discussion
about the interface we should have it. I'm going to be (mostly) off line
the first half of October, and was seriously hoping to have any issues
identified before then. If that can't happen I need some idea what can
make it happen on some sort of timeline.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

