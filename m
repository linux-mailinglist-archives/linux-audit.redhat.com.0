Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B960EA0B
	for <lists+linux-audit@lfdr.de>; Wed, 26 Oct 2022 22:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666815155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rRi0IZ/RTtNheC1QhF+rxVcbpyva+qQiuAsIF13HlVs=;
	b=Y7ho6VRdwWFjhyXZXhaoqPatGjAjlkLvFEXlQOVqYMhu+/OhshHnezEbXVfTQUff7vQHGV
	RFJvKPRK5wUW6hQi4BzG2kNbmTzGVMugMVym0PwLeUCu9R1cpZgu+x+C1m7XooYdqicJs1
	3op5XHR8rjfTHf3q06OSatOoSFGy6Lw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-Fqg0XtF7N8ac8PhwBZURjA-1; Wed, 26 Oct 2022 16:12:31 -0400
X-MC-Unique: Fqg0XtF7N8ac8PhwBZURjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D689080280D;
	Wed, 26 Oct 2022 20:12:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9EEE1401C22;
	Wed, 26 Oct 2022 20:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 033EA194704E;
	Wed, 26 Oct 2022 20:12:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B938F1946597 for <linux-audit@listman.corp.redhat.com>;
 Wed, 26 Oct 2022 20:11:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9EA4840C83D9; Wed, 26 Oct 2022 20:11:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E6A40C83BB
 for <linux-audit@redhat.com>; Wed, 26 Oct 2022 20:11:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 114A11C068CD
 for <linux-audit@redhat.com>; Wed, 26 Oct 2022 20:11:57 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-OkMAKyEDNkeDNT1BlqrQZA-1; Wed, 26 Oct 2022 16:11:44 -0400
X-MC-Unique: OkMAKyEDNkeDNT1BlqrQZA-1
Received: by mail-ot1-f53.google.com with SMTP id
 d26-20020a05683018fa00b0066ab705617aso1277222otf.13
 for <linux-audit@redhat.com>; Wed, 26 Oct 2022 13:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+yB9JWzLCvOQcp5Rtm+NpUgpVIhpMOKoZ5axYcO2dk=;
 b=robWiVQKWULu+GFzuH5Ct+BCzN/wbfiLR+cObYbYyZXg/ij6MGB8K+ehB4o7+evikD
 VBjrUh2+6Gkh8BWJFA1mwC++p0yti/HNbPEBkl2dCR+b3887Z/yA3uVw2ghJJ9Zhq8rW
 pmlb8tL3wwraIc4xMY15ma9ODHPgpCtYzUEPvnZoh3/rEuy8yIvjmJA4GKLfKxkYW9Jy
 1U7IigW+T0+qGAynlgBxhzhcDkl//vkbJAs412uzaFd1nYw4YnySl6M1JC0sR4Q/VW0C
 x/uFCFSNSrk7TlHgypx80yM8Wtpgp2Tdj9UaqeKuz6RmqY404O6alF59vn6/krFBEoUb
 hHdA==
X-Gm-Message-State: ACrzQf3Ayy48sIgr+kaMnvDGcMZvfr85n1eXnI7mwaxI7vkC7ZsMNpOh
 7yRddplCTH3+REqJ0ovmGbqJDi1+wB3sWmi2F7ZURD+1uQPs
X-Google-Smtp-Source: AMsMyM6lmq7EnEcaLyRqwHwy7n/ne2R70IePENv0WDRopqrTSXpsR3RkipltXX/iojSZXiX0U1hMMO+moWlUxiEg2Xo=
X-Received: by 2002:a81:f87:0:b0:368:e612:2dc with SMTP id
 129-20020a810f87000000b00368e61202dcmr30774776ywp.244.1666815093067; 
 Wed, 26 Oct 2022 13:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
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
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
In-Reply-To: <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Oct 2022 16:11:21 -0400
Message-ID: <CAHC9VhQy91eezWMQ=MoLe3fQSu_Rc+ZUWW2Mm3+78Mr7vS_Z0A@mail.gmail.com>
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 25, 2022 at 7:20 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2022/10/25 19:26, John Johansen wrote:
> > no, Casey is not. He is trying to find a path forward to get LSM
> > stacking upstream sooner than later. He has made proposals that
> > admittedly you have not liked, but he has at least tried to propose
> > ideas that could work within the insane set of constraints.
>
> I'm OK with getting LSM stacking upstream. But changes made based on
> only built-in modules are bad. If LSM id cannot be assigned to loadable
> LSM modules at runtime because not all loadable LSM modules will be
> in-tree in order to get an LSM id assigned, loadable LSM modules won't
> be able to utilize e.g. lsm_module_list system call (or whatever
> changes made while trying to unshare resources/interfaces currently
> shared among SELinux/Smack/AppArmor).

As a reminder, the LSM layer, just like the rest of the kernel, has no
plans to provide any level of consideration or support for out-of-tree
kernel code.  LSMs which are not part of the upstream Linux kernel are
not our concern here; if they fail to work with the syscall and/or LSM
stacking changes merged, that should not be considered a blocker to
upstream development.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

