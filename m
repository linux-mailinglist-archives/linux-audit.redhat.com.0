Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C2613AA9
	for <lists+linux-audit@lfdr.de>; Mon, 31 Oct 2022 16:48:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667231292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N/U1P63Z6OFFewhFfARjxYwt2ZbbMvW4DSToeI8usCE=;
	b=dgL/G3m7hk8r6N2iLGAjDfJ3xjO3UIrLZy+Dow3AZA45InAGyimiiKTm2PnOwByotO3YBI
	ji063TqjiZDj/aNouuY1HzoPkXBBMAw0jwbsdWUO3BJkNMqYrZODLl4Qg/+VOmZWtpBY/I
	df6VN+MLCcsQG0mFJZNYWK7RSWIQr6s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-V1zvmXl8M_eDAefEKSvCJQ-1; Mon, 31 Oct 2022 11:48:11 -0400
X-MC-Unique: V1zvmXl8M_eDAefEKSvCJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DDF13801F58;
	Mon, 31 Oct 2022 15:48:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B50242024CB7;
	Mon, 31 Oct 2022 15:47:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA4E519465B1;
	Mon, 31 Oct 2022 15:47:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25B4F194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 15:47:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9251C2C7E3; Mon, 31 Oct 2022 15:47:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1BCDC202C5
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 15:47:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2BAF88606B
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 15:47:57 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
 (sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-115-nIryzqCmNaWUIaMgxrWCGA-1; Mon,
 31 Oct 2022 11:47:55 -0400
X-MC-Unique: nIryzqCmNaWUIaMgxrWCGA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1667231274; bh=rS+nroPJc1Ym3Q/5Bcn2++smfcgYzS+5i6p+LBnTAZu=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=VH538DSGwLtITK107w5fn3ipR5GYPB6UrptVkc14E2hcjsXTOpWZ4IGL9Jc7qWtYXoRigRvcWV0gH0G2EkzHi2dU3gp+3RaXbqmN9UbTQxPJUrvGzTMYr/ZtYc6g1wap7gqVZCxTaNFpO52hKfJfrH/nX9wELDgaV76rWIP+maRMOdygYF/plL02gxr+M9+n7IwbmPFOiFIEA2nEgrRY9vtlZz1gE6JQfjQ+yWFtDRZii76YX+QpMAKwTlWkDdjvjbP3napiAEtoXZ2y7bjD6MULnX28enBejVpuwIh/ionhJp1NzWGyubXV5gwU69Wk8mW1veUQwZwpjCbwtQDtxA==
X-YMail-OSG: yF8gabgVM1kSK4WgJpEg_phOhluwf7DVxl5Fn9Dk7tCOQFpXYs4QTiWcaugCQju
 r3X_AI6nPAYRO38Jf7E5j1nFO1cPGNgKtWkPkKTUfTeZMPwhoNbk8LMfW3Wo280afNN2XWvV5_UJ
 sM8pbxhMUPQO.IDKopsjVtVUHEQmQA7NB0ZY0sHaP.XpHArEfYZxKaUEKh7YWqFoz1d0D6R2DyTf
 Ltp7BL2w7h2oLRIRwU8ZUfbGqyRCeHOrDmqPejzAuhgecUr5PfH9gNGb4aeuvXy.8EHcbD7bfeVo
 M01QvY8RBccexW3DtYXUMCOdhUjFMXEvkgQ5gZ8lILFAXMOC78PiRRjDuyDxYtX7O4yHzBTeLwZd
 GRJ4HA1YT2jEnq5JjsM0HxDtqRGGqeMYnFBly77u6nUnpeXo8kHS3juRbkiQlEwvxqFMFwmiciHI
 iQ1YabW.XfM5RYiqL19TPSCS8QkpJ6oo1ISS8Iv9W2rJsvZY7zicLRCHPxqDIbu01auZtMD4e330
 wYfILjJRvTu6AeF67q3AZvXdJPop5UN0hgCcm5ufhRnUj698yyV0XI.0JWmoqpGoR9WcJK0ev2mn
 fZ9RBbqOzXXrSuBoMJpmMc2RL5vhEl1ox3FmQvExO78GfBIVbp._Sa70nBFFey3ec75PwUYW01o_
 RyQKOly9GRPuqXyYsTVAXEkPdkleam1FzOR7lp0VaZuP3ej1jG1k47U_ld0243yFOanpM_DFtPvs
 25fyTZq6tArYFsjS0gNphIfmYQUU_LZhr_EpyQIoiBXHukOVwyQIeOBFm_vPT_5CnwVapmRojS20
 n3EvS2gsgmenm.6IuES_UrBZh3hxeNXz3.krbESJ_kD0xLmiVR38oSjRYBfVHNUiokp5CaMp_yA0
 3EI6OFqdwzy2uXy9cfP38WGkYjxu3vsXFj1qvFy2w9.jHNjjYtEl28GCjI8c95O2lzcybwur2zon
 cX8BGVYdvlainBmHVLfQFd6oxwbk5xUEElYbwIMhj7qW2pTSuNcQ7UGlAKdY4kkYFslI2Ez.zL6u
 mCCwTTijIRp18BYT097XNu45JnrrTLnwet1obF91MQ7nWQobE8QoZf13GH7Ss9fL8EyNuJkDofw7
 lJVRN43rVuxdabIPW9EmUORQNqPh.tpqlxel4f1bkfC6Y4JW.CZ9W.c_7zx4erp6zd8eL2KQQxVp
 NQA7RiHPCqissbgs.a.Unze_LHu_0q9ICaidB5JDGMw1PZQjzBVj4Dv4o77RTmoKMRiqOpZtx09p
 BIWCpWZJseLyjPKsvRlNBg.Pn0NS_l8oPJRw2s1DvJX9MxtFipEM0g8DPSsa8XDQLz0gTtveagTO
 zjY8iakcM9hOMJc7qW.iSGVX9Ttiu1hxgt.4KBPmDoHj1emINPKRTNJXBfr_ZONtI.vTfU7e3N3V
 Z3aUjlexhJawchg7a6GyldgiGpNqz3Yo8e.Q7yRnVJHOn695A2NN7VTUHagNzJJ2iLzMQ5CiqRnj
 LJl0fCfWr.g0eJ3J8VQpsS_KEmDs.NHGuAijJyG4FLTbkAc80xPXcNS0oYUnz5pkTxm.nIcaDqw9
 HvevyGa4VJIji65N30PkE94JyCFc6q1LwggWsa2SLRhP3IwWpi.qKkeD..C5VdLvxNMokfrQbWbD
 6jnIi4A6aGhY8momsgvFzG4rBQNpsayT.SHIIgxXa0bekWEs.BqJsm88ZQSl0.xdzYp2Bj0VKLLt
 kcNaF23sU6BaaJZNsKEm5MW2FFNC1dsk6BADcsB2WcWDukg1CrhBGsTLSC3eIcJ2JFgHO_B2pjGA
 pmwkb7pqKaqgi7SF_feWQUE8U6enWqvyvRjIAOS.DLE5W6I4GEflcwPxThp3BBg8XOc9HUqfaEGE
 fty0M0xv9WUS673wbCnEWPbA9JTKG7z20zeaummKTXdcHbnWabaxIHf2.TGz6Bn.S1p.j9MQfj0S
 Ncbgc.yol.455RneWUqMro4mgFJ1Io3s86Q3VxDCN7yVqa3lXoxq4HOFHRwZU83zeT3z8QOPzfhk
 bjtwkn8m3FedX7mGlP3SB_hRTQQxzKOO32D1wSHQ06lyou.lO556Hh7ZX1kP3awdi10w90UvTQ3z
 .pYgLJH1R_o0hFzcy_c4XV77BKEX6XOXV1OGqVwfiR7a_0U9b.ZiHRiLlPAO2IbTz84qRQ4Kymk.
 LYMCSOrkKnx5mLxEDCiacloLDr2w5fjkdbMoN1O2n6yVZf8vMMnqTAJTMcfrznAQEFVEyB7tDUjp
 RPI1Utnr5wrDC2j6NQuuxm1jRZKDhy9jnp8FsKZ3bksiHU1IIlxHKNfJ4dxPfczxLRbZH9M3qnxq
 hTHwyynUYt8R60bVIn9w-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Mon, 31 Oct 2022 15:47:54 +0000
Received: by hermes--production-bf1-64dccd5d47-nqrxc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 029f6b6cde7252c779b63f2fb8fb1760; 
 Mon, 31 Oct 2022 15:47:52 +0000 (UTC)
Message-ID: <0d12ed29-ec1d-027a-5a87-f8a6687a04fe@schaufler-ca.com>
Date: Mon, 31 Oct 2022 08:47:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Kees Cook <kees@kernel.org>, John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
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
 <f7548061-e82d-9a39-ed15-0d32551b4099@canonical.com>
 <53b07579-82f5-404e-5c2c-de7314fff327@I-love.SAKURA.ne.jp>
 <aa5424f3-05a6-530b-bf5f-19e5421f8f3f@canonical.com>
 <2c48a481-391f-85c7-be4f-13bbc1553aac@I-love.SAKURA.ne.jp>
 <AB202AC7-9C8D-4109-B4EA-87A7BC1BADF8@kernel.org>
 <feaa5cbc-342e-3863-e761-e7ac8b08d314@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <feaa5cbc-342e-3863-e761-e7ac8b08d314@I-love.SAKURA.ne.jp>
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

On 10/31/2022 3:26 AM, Tetsuo Handa wrote:
> On 2022/10/31 1:37, Kees Cook wrote:
>>> You have only three choices:
>>>
>>>  (1) allow assigning LSM ID integer value to all LSM modules (regardless of
>>>      whether that module was merged into upstream kernel)
>> We are not hardware manufacturers.
>>
> Excuse me? We are not talking about whether we are hardware manufacturers.
> We are talking about the policy for assigning identifier.
>
> I don't like how LSM IDs are assigned, for Casey said
>
>   >> If the upstream kernel assigns an LSM id for all LSM modules including out-of-tree
>   >> and/or private LSM modules (that's why I described that the upstream kernel behaves
>   >> as if a DNS registerer), we can assign LSM id = 100 to "belllapadula" from A and
>   >> LSM id = 101 to "belllapadula" from B, and both "belllapadula" modules can work
>   >> without conflicts by using LSM id. Of course, this implies that we need to preserve
>   >> unused space in lsm_idlist[LSMID_ENTRIES] etc. for such LSM modules (if we use
>   >> fixed-sized array rather than a linked list).
>   > 
>   > Of course the upstream kernel isn't going to have LSM IDs for out-of-tree
>   > security modules. That's one of many reasons loadable modules are going to
>   > have to be treated differently from built-in modules, if they're allowed
>   > at all.
>
> at https://lkml.kernel.org/r/7263e155-9024-0508-370c-72692901b326@schaufler-ca.com and
> Paul confirmed
>
>   >> Currently anyone can start writing new LSM modules using name as identifier. But
>   >> you are trying to forbid using name as identifier, and trying to force using integer
>   >> as identifier, but that integer will not be provided unless new LSM modules get
>   >> upstream.
>   > 
>   > That is correct.  In order to have a LSM identifier token the LSM must
>   > be upstream.
>
> at https://lkml.kernel.org/r/CAHC9VhT2Azg1F-G3RQ4xL7JgA3OAtHafzS1_nvUyEUFsCJ9+SA@mail.gmail.com .
>
> If we can agree that the upstream kernel never refuse to assign LSM IDs to whatever
> LSM modules, I'm OK that we introduce LSM ID integer value itself.
>
>
>
> My next concern is that we are trying to use fixed sized capacity as LSMID_ENTRIES,
> commented
>
>   On 2022/10/13 19:04, Tetsuo Handa wrote:
>   > On 2022/09/28 4:53, Casey Schaufler wrote:
>   >> +	if (lsm_id > LSMID_ENTRIES)
>   >> +		panic("%s Too many LSMs registered.\n", __func__);
>   > 
>   > I'm not happy with LSMID_ENTRIES. This is a way towards forever forbidding LKM-based LSMs.
>
> at https://lkml.kernel.org/r/9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp , for
>
>   struct lsm_id *lsm_idlist[LSMID_ENTRIES] __lsm_ro_after_init;
>
> may cause out-of-tree LSM modules to fail to use the slot.
>
> It is a strange hack that users have to enable in-tree LSM modules or rewrite the
> definition of LSMID_ENTRIES in order to use out-of-tree (either built-in or loadable)
> LSM modules, for LSMID_ENTRIES is defined based on only in-tree LSM modules.
>
>   #define LSMID_ENTRIES ( \
>         1 + /* capabilities */ \
>         (IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_TOMOYO) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_IMA) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_YAMA) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_LOADPIN) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_SAFESETID) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_LOCKDOWN) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0) + \
>         (IS_ENABLED(CONFIG_SECURITY_LANDLOCK) ? 1 : 0))
>
> Although built-in out-of-tree LSM modules would be able to rewrite LSMID_ENTRIES definition
> because users will rebuild the whole kernel, loadable out-of-tree LSM modules would not be
> able to rewrite LSMID_ENTRIES definition because users will not rebuild the whole kernel.
> It is still effectively a lock out for loadable out-of-tree LSM modules even if the problem
> of assigning LSM ID integer value is solved.

Propose an implementation of security module loading. If LSMID_ENTRIES is a problem
I will help you resolve the issue. My bet is that there will be an easy solution. It
may be as simple as adding (IS_ENABLED(CONFIG_SECURITY_LOADABLE) ? 1 : 0) + \ to the
code referenced above. But I can't say until I see how you're going to address all
of the real issues.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

