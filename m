Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AE760E492
	for <lists+linux-audit@lfdr.de>; Wed, 26 Oct 2022 17:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666798480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mXJpMIn85hALuGnv0TccG5ON6kBa6mauxPrOgl4n0wc=;
	b=gKytMII8FzPh6BTy5SwB/Z3+cvGq5vjHZlr9jzqJGE3m1VSRT3WvSFv+5r41uFVfT+8MrB
	+POSXXlDHU9qJHYXCT/O8MLOUr0IGCYsG2rdz10QYEb2SzZFbo2q3twEnq31IR1uIIhTTG
	o+TtqfbNUeRQk2LuexGHweQVIAaPltg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-2PRj2PT4PdWbJy2E5L-7zw-1; Wed, 26 Oct 2022 11:34:37 -0400
X-MC-Unique: 2PRj2PT4PdWbJy2E5L-7zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23EA529ABA02;
	Wed, 26 Oct 2022 15:34:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 770682027061;
	Wed, 26 Oct 2022 15:34:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3286E194704E;
	Wed, 26 Oct 2022 15:34:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1289C1946597 for <linux-audit@listman.corp.redhat.com>;
 Wed, 26 Oct 2022 15:30:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0493C2166B38; Wed, 26 Oct 2022 15:30:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F11612166B2B
 for <linux-audit@redhat.com>; Wed, 26 Oct 2022 15:30:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C98A73810782
 for <linux-audit@redhat.com>; Wed, 26 Oct 2022 15:30:49 +0000 (UTC)
Received: from sonic316-26.consmr.mail.ne1.yahoo.com
 (sonic316-26.consmr.mail.ne1.yahoo.com [66.163.187.152]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-367-mbCjp7WPNpSMyniSSAAKWw-1; Wed,
 26 Oct 2022 11:30:46 -0400
X-MC-Unique: mbCjp7WPNpSMyniSSAAKWw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666798245; bh=OpP7JdQXUdADZ/I4ba5jrpFzQO5k9bHuyp99cdKR65G=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=hcYtK4idvt9iLJnZF6OCKBUB08jXmF8cZ1HRQjqU4H22pim0OUTeTxjnXCRI7xc7WvsR3YFqQNDnrG/O/3pX4RW2r/fI0oQpEmD3zTcrZwfsLl/JHtTT6XGkiUpbXo3Xd2BM1CkMhrE3OaiN3xj/kNzOyWCpz9xmPkEruaknIcaW65UCDONX3PYJVr7oxVe5i2cTF9i7JFDj1JneRIOioashM3XGv9IO0piQk88NG9meCDyBJwSlZqi+aD+ObZCUn+pr4QHn9oRRTOyqkqzj1SUnJxYafMv7huI3wD5/lca60UF2MtBr5mgg/vUZ24BypP/VkliltUIGrqaGS1Mtnw==
X-YMail-OSG: RCrcKPgVM1mro0xi0j8pXUbwFroA24PmwlyqFaiJqE51cE5_hqaE_5U5zT5Ksot
 3v09qBALZiAmENmlJQ9yO0v.WtPwiWDMjxiNOI3Lek_xm6XAgiy7Ggk9WB1nV8ocREUwsNMN867M
 QZoCF9yC5xQW8VSCtS3ymRKThdYSMbIHMnlmohjJPzusdfHpBgFfhaZ1glVfqHRGWtSs41ACCRxi
 u8t3PP6317JTjlGkn6KlnEzZ91Y9Qn3rwtuQnzC6BDKBA2fpjuJRo3fOVoIM3Z1QxRzZ5B.0uHoJ
 WNbLZERPF8f5PKwh_6rsTGajlNy1Amfj.eez6NNZ9iERMdf7Z318FnC4AYYzmMmfPPgunO_8zJNG
 sBsiM7mVijad6RCM6rE9wO61vs0IkUQJMkgP7WQRGFkSv0C3PZZWQWTLlMLqkTVTV75Vs_u_dlOh
 aEZveQL.epmgwLrghHr_Z5qJA7aWRczn_mb_2G6GKg9Ben9xP52ymBUP70m2D.DAhyZUSsJJO6mB
 IU6LMYefyV4hQeazHy6ik71xfFHJeuB1In.H6SHJBFQ_JcAqKDDs5kcbAOxwzswHK9stmAa7Rt_r
 lJUvfy0pEI7rJylBsiyx1QZ0.qqFTSPU9OyDX7F5Vo7Ma7WOa7D3Ab1_FiV_sSKqo0mMG5xyOsoU
 GMxiv0mMSBhOtqlgnIEu158hgGQeUGXkztH1PLkCjpC3fd1BBOquJtjQGUIHfk1QpRM9Um088UGB
 XvOT8ovcyFz8FUufS_nNpUi69nUSgDPMSZvOMy7r2s4k4b1xx59VFFqt4CiPkuM89N6qJRZOnnTa
 7ZtXUmI5HmTK2MuHw4s99DcCJcG065TmpOVGiKjrnMbolULGl1eoMI0QLuQ9ZHmKl7.qCVczmaSd
 PQ0Fg_UtPOd7CYcMT4lFV4Tz2DAGLwtw_nqmZ9GL5t.jELfiu6wkQLvM_I8xc2_hxu10s7DzWOET
 dbUm9GN.Tg26BI4DGOTW8MhX3XTYNuSJl08f0fjnecuJKaJWS42rqQHRn3vE9GMI.o0kGaP.yulX
 dESj4ErlFTunp1LsDMvZC4KZSokObMLsB0v.h6hCFcwisjtfIqrcc8dtALJpT5_Sl481HcpwcvuZ
 milFstH1lZM14XPJfHLv5C4QCvaRBAWG.X.lY8xt9GzXOJz3zNoMyOPMH9tDHQKshr_60lWbEBYF
 pESbUqr7qu58cqBmzIiYHuZpKXqlbFEJI3rGb4dUEjWlaS9cgrUWuM..JTbvx92W111apj8u.YcI
 Lzvb.Z1Hi8gE0k8LzfxmA0RVtEPnzxokZADAf2iKe8u63hSjI_F4A9MqfZ3zR6Ica516OITkTd5v
 1Sut9ykRAswqzAQQmXMqodQoyWhZNkmcQ23ytMTRvCFBbrUdp2TnEPHPZCHi1vJ9K3d.fY_RqqPR
 iacZCS3bGt89Cwm4v5R6RidS2yJLAaSLkUTO9Psc4nWqV5lYUvsy1jyApRzftSe0wIvN8xPpBAHz
 R7vJVYUz1QJd6kQid4Y.dmpqZmk9Ye49lej1PpCkjsYolxdab_4RshHzciZJEfzuVLWjYnmEK_ow
 .jVtROrUBJ8X5ZUWcm.0vmqqBN8.LlOqMf7iJ5XzOvxhX6lYV.ntcXmiF34OXwwzNfSH68j_A0ON
 hQmHLZEmqLlBUaYsL6dA5ZOVw0MVAniFF_qzSLGtDhKBEPnH_jqkvICMaiRDgOXXRX.ZAMQyjWo_
 qvD082QbJNnU7VPJkiPEFXA72CfMWinAd7lJHLhp2R11cPX3_qKD6AoAmy8OeqRaDUOONnlJEbt4
 11OdmlYZL6UJSyg2NWD6IZhAl3NoFjhC32ozPFFf0fS8_SswDCOmoBKtWI7aenFlr0AfGLxYCy3z
 fp93WOLNXeUTz_j6uNljpCb17cRWeAam2PlizkouTpfOsXjpkceytIMUcYZZ4G2Z9mN6Al4HSTpa
 ScZe2dahid38lLPUV3lThSFe84Erw8.FIL_a6gN2Kz.UylrIm.7npQVJ_F00Ov_nlR_peLD44qGk
 NYgOiC2CmgL8ITA.bUML1W2Myt82NpbKbrjIWibGuZIE735VlFPGdOiKX6S2U67hTrYAUTXx0zXG
 CLyD7uhJAMUc25d3xoIXn8XH3qjNx11lNOoUwtlQHUB2uG7qt8xeJZoPPq5lZJIGDbVU29aS9Fvw
 zlRsz3KzBkZfPP.VbnLAznuxOdlMnS_4nOuH5kyZKgNa0UFs5BzuetqxqtkDkqdVpgX43Rc7kgo4
 iuKXKlCkR_281zVsJx339IaCCUDAfD.K_IR6fJIHn6vY9zImEYSkXLxMid91frpGnPZcGN8anvzL
 dHUFyAW1YAsgcbDm62HdXnG8-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Wed, 26 Oct 2022 15:30:45 +0000
Received: by hermes--production-bf1-64dccd5d47-79dtx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID cdb134c574ba02950eba7a632f099359; 
 Wed, 26 Oct 2022 15:30:40 +0000 (UTC)
Message-ID: <7d0feee1-a9e6-ac82-6962-89b17af025eb@schaufler-ca.com>
Date: Wed, 26 Oct 2022 08:30:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <5ef4a1ae-e92c-ca77-7089-2efe1d4c4e6d@schaufler-ca.com>
 <CAHC9VhQRpeOMkeEfy=VRPnpuYMUDYgLp56OjQZPYwoXmfHYREQ@mail.gmail.com>
 <c679cea7-bb90-7a62-2e17-888826857d55@schaufler-ca.com>
 <e9ce6253-c8a3-19c3-1b71-f3a2e04539bc@I-love.SAKURA.ne.jp>
 <cc14bbde-529e-376c-7d27-8512ec677db3@schaufler-ca.com>
 <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
 <11564f69-3bba-abf7-eb46-06813ff4a404@schaufler-ca.com>
 <98ab33d6-6c91-9c0a-8647-22f6bdede885@I-love.SAKURA.ne.jp>
 <aa201ed7-9ca1-9507-08cc-156f280ee5f4@schaufler-ca.com>
 <3266c2c2-cd7e-bc0f-0fc4-478a63d6ee77@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <3266c2c2-cd7e-bc0f-0fc4-478a63d6ee77@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: keescook@chromium.org, SElinux list <selinux@vger.kernel.org>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/26/2022 3:19 AM, Tetsuo Handa wrote:
> On 2022/10/26 7:41, Casey Schaufler wrote:
>>             You need a built-in LSM that loads and manages loadable
>> security modules.
> That is no longer loadable LSM modules. A loadable LSM module must be capable of
> loading any code and using any interface that is allowed to loadable kernel modules
> using /sbin/insmod command. That is my understanding of what you have promised (and
> the reason I am allowing you to continue working on LSM stacking before I make
> CONFIG_SECURITY_TOMOYO=m).

Loadable modules, in whatever form they take, will require the stacking
I'm proposing. They will also require the next phase of stacking, which
includes the networking bits that will allow universal stacking. Even if
the current work goes in tomorrow (demented giggles) that's at least a
year off. Then, and only then, will someone be able to tackle an
implementation of loadable modules. I will not be available for that job.
I have done everything I can to ensure that the stacking work won't
prevent it from being done. I have proposed how it might be done. But
I don't have 10 more years to spend on it, and it's not me that will
reject it in the end. I won't beat that dead horse's head against that
brick wall.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

