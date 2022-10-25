Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A744E60F8E3
	for <lists+linux-audit@lfdr.de>; Thu, 27 Oct 2022 15:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666876758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xXBMRHbT6M+8jpRmxPYVsAtg0d9ZVnEMioDGwLuVuXY=;
	b=VyyL0G2S/SuV4kls5nOCm88OGnyMy73cHouI8xJ5UZdDebPSB4pUam7iBJ7c8Ybb2IDg43
	YRo9ukSbzv98o7fucZB16VWM/UbeTy3LwNu25Jwi3Cxv2GMa+nccm3Z3EK/33uFncFWX9u
	A75pf1bTvqkbzLsvbaQ2Q1aj/KSxgLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-IZkkMRNHOj20aaDHn22L8Q-1; Thu, 27 Oct 2022 09:19:17 -0400
X-MC-Unique: IZkkMRNHOj20aaDHn22L8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29AD482DFCB;
	Thu, 27 Oct 2022 13:19:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D52CF40C2065;
	Thu, 27 Oct 2022 13:18:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EBD6194704E;
	Thu, 27 Oct 2022 13:18:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FC2F19465B2 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 10:35:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 122F41111C61; Tue, 25 Oct 2022 10:35:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 099221111C60
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 10:35:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8BEA3810D23
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 10:35:07 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-173-_q2Tby4hNnuy_5eeKK-vxA-1; Tue,
 25 Oct 2022 06:35:06 -0400
X-MC-Unique: _q2Tby4hNnuy_5eeKK-vxA-1
Received: from [192.168.43.182] (unknown [62.168.35.125])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 22B144230C; 
 Tue, 25 Oct 2022 10:26:17 +0000 (UTC)
Message-ID: <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
Date: Tue, 25 Oct 2022 03:26:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <269014c6-5ce6-3322-5208-004cb1b40792@canonical.com>
 <CAHC9VhRrOgDMO9fo632tSL7vCMAy1_x3smaAok-nWdMAUFB8xQ@mail.gmail.com>
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
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 27 Oct 2022 13:18:14 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 10/25/22 02:48, Tetsuo Handa wrote:
> On 2022/10/25 1:37, Casey Schaufler wrote:
>>>   What I'm insisting is that "warrant the freedom to load
>>> loadable LSM modules without recompiling the whole kernel".
>>
>> Since security modules are optional and the LSM infrastructure
>> itself is optional you can't ensure that any given kernel would
>> support a loadable security module.
> 
> Like I propose adding EXPORT_SYMBOL_GPL(security_hook_heads),
> I'm not taking about distributors who choose CONFIG_SECURITY=n.
> 
>>> Adding EXPORT_SYMBOL_GPL(security_hook_heads) is the only way that can "allow
>>> LSM modules which distributors cannot support to be legally loaded".
>>
>> I believe that I've identified an alternative. It isn't easy or cheap.
> 
> No. You are just handwaving/postponing the problem using something unknown
> that is not yet shown as a workable code. Anything that can be disabled via
> kernel config option cannot be an alternative.
> 
Uhmmm, loadable LSM modules if they ever happen will have a kernel config.
If not distros will carry a patch just like they have for unprivileged
user namespaces. Trying to force distros to allow out of tree code just
isn't going to work.

>    Quoting from https://lkml.kernel.org/r/2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp
>    > Like Paul Moore said
>    >
>    >   However, I will caution that it is becoming increasingly difficult for people
>    >   to find time to review potential new LSMs so it may a while to attract sufficient
>    >   comments and feedback.
>    >
>    > , being unable to legally use loadable LSMs deprives of chances to develop/try
>    > new LSMs, and makes LSM interface more and more unattractive. The consequence
>    > would be "The LSM interface is dead. We will give up implementing as LSMs."
> 
> The biggest problem is that quite few developers show interest in loadable LSM modules.
> How many developers responded to this topic? Once the ability to allow loadable LSM
> modules is technically lost, nobody shall be able to revive it. You will be happy with
> ignoring poor people.
> 
> You are already and completely trapped into "only in-tree and supported by distributors
> is correct" crap.
> 

no, Casey is not. He is trying to find a path forward to get LSM
stacking upstream sooner than later. He has made proposals that
admittedly you have not liked, but he has at least tried to propose
ideas that could work within the insane set of constraints.

>> Of course the upstream kernel isn't going to have LSM IDs for out-of-tree
>> security modules. That's one of many reasons loadable modules are going to
>> have to be treated differently from built-in modules, if they're allowed
>> at all.
> 
> Then, I have to hate your idea of having fixed sized array.
> 
> Nacked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

