Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D2610DAE
	for <lists+linux-audit@lfdr.de>; Fri, 28 Oct 2022 11:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666950635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fg8WvUBFmxKojtCEs/rba+fpNXBYBQEr0TaZH4G3qI4=;
	b=T+UlJIXEZKaiercCAcl0MCpPCUKuXZOAOkbsbGuy41b1PN3r6Q+0SNvLuaEFqtVx+9mRW2
	DZxGPIRur3OOTGp45ORvEUoB7wk+eOXdwHF4rpqGZQQNaJ0CkHDKK5ZNFVkwZBbz0k+f3c
	ZA9kXdsaBC6E9sm4+R4MrFk5xb292vk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-ndXQxZ9rOJ6pYE6Atu4jFA-1; Fri, 28 Oct 2022 05:50:32 -0400
X-MC-Unique: ndXQxZ9rOJ6pYE6Atu4jFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AECF2A5955A;
	Fri, 28 Oct 2022 09:50:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B78B40C206B;
	Fri, 28 Oct 2022 09:50:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 17C0E1946A7F;
	Fri, 28 Oct 2022 09:50:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 670141946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 09:50:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B822C15995; Fri, 28 Oct 2022 09:50:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4438DC15BA8
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 09:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C09185A78B
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 09:50:21 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-uTl0dxogNUiJL0yn_o1cbA-1; Fri, 28 Oct 2022 05:50:18 -0400
X-MC-Unique: uTl0dxogNUiJL0yn_o1cbA-1
Received: by mail-oi1-f180.google.com with SMTP id g130so5580722oia.13
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 02:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJOZ7nL7nUVuoXx6yfQht5u/rUZxqZv4VWUs7Qhk1hE=;
 b=o1LBh7JV5K+Ve6qfJkXEZOcj04M9nAPPVAC8tfdd+p82uSGLW+jHrS7VhVtwCb9Y7e
 qA1Bs5pXfDC9dk7EUzeGcdRCIeu1aQUQ7BXa7RQpgBd1BqiY7OwbqlCnFNMT1Tzv20iT
 lQuXQAnUHAVQhlRPFYHOMI1Q8M4uIjGpXz+laubYl76w7vfdhStBkdP43/12f5xbFh0P
 gQBNm6ooE79B7QA3ycKtXJj5O0mOfjifwjx+QG6LJZ97ai54aFKPhbuUEznTZhxHMzUW
 LfAuKZc8ywlUnZk8stdiIBfHfmROmZ3/uVsE5rWNtTqKLlCncPtukoC5TPcVgLSzG3DP
 fqAw==
X-Gm-Message-State: ACrzQf0zldo4PIuo1MaRN2PeIzjK7sOO6oAeukx8T/Dx3hGppDSraC6g
 dai5oWBECJw7t+YK+OMUcds8YtfUgmKVkVNegh94
X-Google-Smtp-Source: AMsMyM5LT56WrX8xq2cDEwU9MowuTZJprtvIM+mNwCDsAdE4o56WE0f9ds+W9OIiqC1+bVos/ZfrkQ3B85DspeKDevQ=
X-Received: by 2002:a05:6808:10d4:b0:359:c147:7afe with SMTP id
 s20-20020a05680810d400b00359c1477afemr3882403ois.172.1666950617668; Fri, 28
 Oct 2022 02:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
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
 <CAHC9VhQy91eezWMQ=MoLe3fQSu_Rc+ZUWW2Mm3+78Mr7vS_Z0A@mail.gmail.com>
 <a0567b10-fa83-50f4-7bf6-937e0c677e60@I-love.SAKURA.ne.jp>
In-Reply-To: <a0567b10-fa83-50f4-7bf6-937e0c677e60@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Oct 2022 05:50:06 -0400
Message-ID: <CAHC9VhT2Azg1F-G3RQ4xL7JgA3OAtHafzS1_nvUyEUFsCJ9+SA@mail.gmail.com>
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: John Johansen <john.johansen@canonical.com>, keescook@chromium.org,
 SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 26, 2022 at 8:02 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2022/10/27 5:11, Paul Moore wrote:
> > On Tue, Oct 25, 2022 at 7:20 AM Tetsuo Handa
> > <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >> On 2022/10/25 19:26, John Johansen wrote:
> >>> no, Casey is not. He is trying to find a path forward to get LSM
> >>> stacking upstream sooner than later. He has made proposals that
> >>> admittedly you have not liked, but he has at least tried to propose
> >>> ideas that could work within the insane set of constraints.
> >>
> >> I'm OK with getting LSM stacking upstream. But changes made based on
> >> only built-in modules are bad. If LSM id cannot be assigned to loadable
> >> LSM modules at runtime because not all loadable LSM modules will be
> >> in-tree in order to get an LSM id assigned, loadable LSM modules won't
> >> be able to utilize e.g. lsm_module_list system call (or whatever
> >> changes made while trying to unshare resources/interfaces currently
> >> shared among SELinux/Smack/AppArmor).
> >
> > As a reminder, the LSM layer, just like the rest of the kernel, has no
> > plans to provide any level of consideration or support for out-of-tree
> > kernel code.  LSMs which are not part of the upstream Linux kernel are
> > not our concern here; if they fail to work with the syscall and/or LSM
> > stacking changes merged, that should not be considered a blocker to
> > upstream development.
> >
>
> No. You are misunderstanding.

With all due respect, I understand your point very well, I'm simply
trying to explain to you the position that the Linux Kernel has
historically taken with respect to out-of-tree and in-development
code.

> This problem is not limited to out-of-tree and/or
> loadable LSM modules. This change prevents new LSM modules from getting upstream
> due to a chicken-and-egg problem.

It does *not* prevent new LSM modules from being merged upstream.

It may make it more difficult for out-of-tree modules to remain
out-of-tree, but that is both not a concern of the upstream community
nor is it the concern you are currently describing.

> Currently anyone can start writing new LSM modules using name as identifier. But
> you are trying to forbid using name as identifier, and trying to force using integer
> as identifier, but that integer will not be provided unless new LSM modules get
> upstream.

That is correct.  In order to have a LSM identifier token the LSM must
be upstream.

> Then, how those who want to write new LSM modules can start writing LSM modules and
> propose userspace changes for new LSM modules? They can't use the identifier unless
> their LSM module get upstream, which in turn forces them not to propose interface for
> userspace programs, which in turn makes it difficult to get new LSM modules tested
> by users, which in turn makes it difficult to get upstream due to "who is using your
> LSM module" question, which in turn makes it difficult to get the identifier...

First, new LSMs generally do not need extensive userspace
modifications; of course there may be some, but when one considers the
entirety of a modern Linux distribution the actual percentage should
be quite small.  In addition, it is not uncommon for in-development
LSMs to have a set of privately, i.e. not upstreamed, patched
userspace tools while the new LSM works to get upstream.  These
private userspace patches are generally merged after the LSM has been
merged into the kernel.

> You are trying to force CONFIG_MODULES=n by just "we don't care about out-of-tree code".

That is not the goal at all and I would appreciate it if you could
stop slandering the motivations of the LSM syscall effort.

> Trying to change identifier from name to integer is a serious bug.

I disagree.  One would have a similar problem - userspace
awareness/enablement - regardless of if a name or a token is used.
Ultimately the challenge is getting userspace developers to accept a
change that is not part of the upstream Linux Kernel and thus not
guaranteed under the usual "don't break userspace" kernel API promise.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

