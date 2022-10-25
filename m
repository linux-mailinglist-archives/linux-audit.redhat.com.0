Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C460CE88
	for <lists+linux-audit@lfdr.de>; Tue, 25 Oct 2022 16:13:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666707189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iaRG1KoOnuO6VY8jB0LOdcFhQLx0ozCVEwmazEOZjZg=;
	b=UfGq9dYImLpHBkX/1mQHuBBtVjgtSuCkF8AukTaUFAdrmP80PjF7YGvx2pqhASX6zWTpK7
	li1XOp8GUj11O+QJswc5J0HPIMyW8hnvCBcFAvi194il2t7pwqEVm5Li6BEu5t/x0R/tuq
	wJdfkueTP86eYHp3GRJnG4uL9+HAuds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-2WreW4TtMRS51ItFflu6Fg-1; Tue, 25 Oct 2022 10:13:06 -0400
X-MC-Unique: 2WreW4TtMRS51ItFflu6Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71A58185A794;
	Tue, 25 Oct 2022 14:13:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E46F22166B2A;
	Tue, 25 Oct 2022 14:12:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7BE01947046;
	Tue, 25 Oct 2022 14:12:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9108D1946597 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 14:12:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75E1A17584; Tue, 25 Oct 2022 14:12:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E00B10197
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 14:12:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B48F29ABA3E
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 14:12:57 +0000 (UTC)
Received: from sonic301-37.consmr.mail.ne1.yahoo.com
 (sonic301-37.consmr.mail.ne1.yahoo.com [66.163.184.206]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-613-iykM7vf-Maag2qAxJ3gPsQ-1; Tue,
 25 Oct 2022 10:12:55 -0400
X-MC-Unique: iykM7vf-Maag2qAxJ3gPsQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666707174; bh=ZuLxdnI7dIHrDdaH+AF9R+GcZn7tyg56OTuIhhYIy50=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Som/NBVr1SpvGOqwyweDJpVVi3KJ3TGtyetdkNnBYnmvglCcHRqWdk8hMlTx2FW4QhLV6wn4JQrpUCEtdgipb7vk6T8s4met1QP6jDrAKmVg+NIj1oJkZdjkhGJyPY/kPHv3TFvLuPPz4MQgzc5FxS+LTta/iATWrMQfSMIKo6/H0lKrSS0u2+ZuNNXPSqv4AB4qrwN4SgFipORwkKH/mhY4s7b78olxmkNOShmCkWGQwoP5imGpm+6MJkhNofoJzkpeLLQlqK9xciQSpQCvn/8k9CnROFOgMvpOEjxft94A/Vz4H8zZZEzpXqnpaiittnt1OfRmS6yDwqHnbeGJ/A==
X-YMail-OSG: 1UGMiccVM1kqGFEohkhtbrsun8bJ5LaoK3jIZzLXyxGn.vUGBfdQZ3cp7lQXgTj
 kVfXB2PguvZkFI64xXG3zARWRLmTsYTq_d43kFauf6E6KPsLl0duUuApW3ZEx3Vmc7lIXKP6C4yW
 rnzru5XzaNqKbL45yG2HuDSgd6FcQSTGTDpBFq1ivxqYuMD6oCCJ.W.I5sG6I_si2_71g_e6GkFj
 6nknGeuWaxq_O62BRMX_MhSRXHOVto.zu8DGmx_zM9AT9lM1fS4RfvUZmtxpBYDAH7vwwI9jATmf
 OEIsKNhWwzZkiDHVG97noJchLdQPJgYfPKqkccAnSZWROIbpfRPJ5vG8g1E5xpuW0D6k1g3aD6lv
 iOihczkhEYYPXj.HMT6PGwPYbb7W2RVwO1y6hjXAsPgt6EYPeSSHsqtxI2IeHM7VrDW60CEdjSW.
 GJ8UelLck1SAFF4FCfYR8BmFa_5TQA.3yOQIZlOk78jxp19b6OvW8o9NYuGK1wgq.ZesY84bMTX1
 CY2YzTkuGHAAe3zOggwnFbgfuZfCqWoWBqD48w9BT6_V6O8nFkP9twEBiMYu7aQOUW_jn6WHnqWC
 EcP0cSJIv0M.AOGRq3jnFO9unii_4Eu6bT4vP.H7fWUDmu2mGmK4jgHK0fnv12WgovSrsE0WZZ5H
 ayUrY6xeT7am3kFZlqVhGkSmjkIuViQEPA7PdG_kB_iVHyeHN._miQTPqlYIQWR9hSa6Z5kWkxjm
 ZHJUqYIzQdr5AGY5ZrQuS5bWN8ArWfK7FrhFmz5zpJJtEL7Yu7AxvnYd.96ftSvhErFuiZfG4KmB
 .p5I19l7c7mmJxcPBOUiLgqmERAb59Lkla7Znmg9g7XRhebdbmjgzWgCEb9mpRQz5bSvrz.z8_6L
 wRzdQ.Wbv7ERvmBjK8gaR4M.ArveY3L3TYfP98MI1g8d0ZxiGqWAGib5ojEFsWILafzJ8MIQkav8
 eUTFZE6J.fhN.KLj8ExTlKn4ZD1yczbMUjEvml.XbrlwYC5.wtLjFISXrpakyXV_LOoErz8Y5YA8
 4MTHG21dYiEGx1bxGoyEDKKMPHXuBdghdC9XdvApTJjnaGBhm1DqekfLXjZ5BzksNXVY.IiEZMGS
 oxm1Ap6a6NoYSGDFpUUa_fMRzksRUmeLc7f8SC6Su0X6u_xMhzwHYKH32VtX30de6PFZXvil3rl1
 p6pM6lcigVZ.TIF5ITrfJ9woPTAq.mN4OkUkMUBq375p20rR.RlZ1j64sWwp_X2IDdZTlLG_WORQ
 gCWGiSkZfYzDdpHSG4EfcQ7uG8J1zXrbJr5dS_Px_W364WS_9bPUTa2vsjb5ZIe__EKJmCnlL_9K
 vPWkK.nVgAYFfwUhteTm_4zNCanYbN3a4U7V8jvqUbVZySSblBUgw02nMHKQ1fDwx8QOdZ6bd_v5
 mB3sZ2UCzqzT.J3GKIQVsFMDihbTEtqLQzsVpoDrEQ6Wq5G94tDU1ojwV6ZnsSqktMq9nW3LDFFb
 ICFaiKJnUfapdkAFwUNlKYJGwLFRT2xyKpiiNILPXACmg7BBNB50FrIfEM3LfxD9qBtrtNPorIWY
 hcAicTaAVlLqtvQngLC8BSY6syC0VCKNHqrUYoXpgrNp1.K4yLso2BO3RJF7ZOSCFERV4OkoDfED
 Sw6cVXxQDHdg5DD.VxkOA_bNiswWWyB4uneApJuagj3mZy83ORpNkCH3BHMH6MQJngoEuEbGfQhs
 ovTq.HiEA8Pp2b0vRV_zCbjANi728Yb2pyO04Xehm3RHi9Q1hAwXD0Kq8wRraUdXHah8.YkGaOmK
 TVpYkLqvU_fUJ3_RbNijAd6s0oUFJNJfXzU8_NkBSNCgugIAw7KEovjGi8Y1QdARn53iZ9ZAD3jg
 WRAg5W834ZPHLbg7Ie55tRVeF6f9dF6Y6oqb8hL8.vV2ty4uhPhY1wUVPSfycY7RuIS18UrkPSss
 i4rhRQDUeohl3QOmGKGszszSaMFlZCcg.1uh25JTAWf3dCrnvv.GdWpMrN8k9ieKvoi1oYi5Vx2Z
 y6bqQK0tw80wWylHfHSoOnXcxSoe3v2MuGWdq3g63rqLzww.mJOvkmqwUnkOSply8q_rWjSBqUtX
 _BWQc7rDXfjGpokCCYAHvEYFdKbjOPpT4ZFPcnuQXPSNqTty.1SW3oly8FIOUYwby3xkFu8kvBTB
 QN63mSVyWjtEZhD_fvhZueXgympb9ox0BjLb2Y5FqbglfugHVCuVN8nPSc4GYE5cOTuTciXWdSUI
 xOGCIH1ExpBj0LyML_Es1FfGnE5StRJ4qDBtnfTY-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Oct 2022 14:12:54 +0000
Received: by hermes--production-gq1-754cb59848-dxw7w (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7385069bd8f4d56b8886cf3153f058bb; 
 Tue, 25 Oct 2022 14:12:50 +0000 (UTC)
Message-ID: <11564f69-3bba-abf7-eb46-06813ff4a404@schaufler-ca.com>
Date: Tue, 25 Oct 2022 07:12:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <1958a0d3-c4fb-0661-b516-93f8955cdb95@schaufler-ca.com>
 <CAHC9VhQPvcunvBDvSnrUChwmGLen0Rcy8KEk_uOjNF1kr4_m9w@mail.gmail.com>
 <6552af17-e511-a7d8-f462-cafcf41a33bb@schaufler-ca.com>
 <CAHC9VhQMeyxQJSAUuigu=CCr44WtpJg=LEh1xng_bPfCCjqq6Q@mail.gmail.com>
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
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/25/2022 4:20 AM, Tetsuo Handa wrote:
> On 2022/10/25 19:26, John Johansen wrote:
>> no, Casey is not. He is trying to find a path forward to get LSM
>> stacking upstream sooner than later. He has made proposals that
>> admittedly you have not liked, but he has at least tried to propose
>> ideas that could work within the insane set of constraints.
> I'm OK with getting LSM stacking upstream. But changes made based on
> only built-in modules are bad. If LSM id cannot be assigned to loadable
> LSM modules at runtime because not all loadable LSM modules will be
> in-tree in order to get an LSM id assigned, loadable LSM modules won't
> be able to utilize e.g. lsm_module_list system call (or whatever
> changes made while trying to unshare resources/interfaces currently
> shared among SELinux/Smack/AppArmor).
>
> It will be a complete reinvention of Linux security framework which is
> merely borrowing hooks provided by LSM. That is no different from
> duplicating existing LSM hooks and managing via completely different
> set of interfaces (e.g. /proc/$pid/attr2/$lsmname/$filename ,
> /sys/kernel/security2/$lsmname/$filename ). Such implementation is
> no longer loadable LSM. It is LSM version 2. And I don't think that
> such implementation will be accepted unless you agree to kill current
> LSM (say, LSM version 1).

The counter argument to this statement is that BPF has been accepted
upstream. eBPF programs are different from built-in security modules.
There is no reason that a well implemented LSM that accepts loadable
modules *that are different* from built-in modules couldn't be created.
I seriously doubt that it would get upstream for all the reasons
usually cited. But there is nothing about the implementation I've proposed
that would prevent it.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

