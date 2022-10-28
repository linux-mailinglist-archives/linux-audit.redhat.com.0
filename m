Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99245611977
	for <lists+linux-audit@lfdr.de>; Fri, 28 Oct 2022 19:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666978904;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lR5BayDu3qAk7CO6UB7xAs95wDgLzmX/Q+2drJaTn7o=;
	b=LFaxvpwNy6bLKrSoEg+6GAJV/IYNAtbd3qc2wEeO4pcZVVyEYYoqbbJW/uCn3ffCMjpylu
	Zn/q2q3LgUG4FYoWBFokyTNPDD4VIaWgDypnSfe82kBnOrNdWvD9k6ba1AatQcaMElUFb7
	oTnbYF5+U4Tle827CJGuAdVxj9aOHZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-CiyR4nVcPXinbEBQE_2g6Q-1; Fri, 28 Oct 2022 13:41:41 -0400
X-MC-Unique: CiyR4nVcPXinbEBQE_2g6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F12101A528;
	Fri, 28 Oct 2022 17:41:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4585914152E1;
	Fri, 28 Oct 2022 17:41:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B2BF7194704E;
	Fri, 28 Oct 2022 17:41:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 894081946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 17:40:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D5652024CBF; Fri, 28 Oct 2022 17:40:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6564C2024CB7
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 17:40:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B497858282
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 17:40:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-Ao4krLeHOLi20arBe1GP6Q-1; Fri, 28 Oct 2022 13:40:40 -0400
X-MC-Unique: Ao4krLeHOLi20arBe1GP6Q-1
Received: by mail-pf1-f182.google.com with SMTP id b185so5351743pfb.9
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pD8xAs6hz8K/GwlkkWEBIlgMqA6rS7UqF9zh8XCJrDM=;
 b=DUCgvB+HNUr/G5GmBqCxq2Pni8nAhlWhQeff3AfAnlk3edmxhi4HmT1FBUXFfwgHis
 LYiFgxi0VGZUfJGcWdDYufbVVeCDv52MDMnQ/4EVB4tplZUAIym3zoPuvZGHz59tXwS1
 AKZPBQVE9aU6OKidhYto4Pb8LlcOOCK7cJiFLueKKOV/S/Q/t31RWNFI2YJDWQIdbVsZ
 S1q5s/90x5G0Rbo0YMW0cveQLYKk0XPxEkUzmmFwUrH0e52jcTMAeUke8PmCNBYRLvXu
 DJcL9UHzsE3fOlBEaUO8Z940y6Qi9ISaeLRdkWxk3lkVh7P2whTIBGiNzFdkzThGvrKo
 NIKA==
X-Gm-Message-State: ACrzQf1rszJLNmiKl2yPdjOPxeF1VRvIe4P8KqKAMPzojYsZdLh/d6YX
 GK9e/DFyEgse0TjtGtJcVTkKNQ==
X-Google-Smtp-Source: AMsMyM6DTNw3s9S/F5sJs7fsfz3/GYHCtEIHiJDX19noke49fsc96sZ1X8ywUtxMWK3oLrmdy33pug==
X-Received: by 2002:a62:b501:0:b0:557:d887:20ee with SMTP id
 y1-20020a62b501000000b00557d88720eemr394469pfe.8.1666978838423; 
 Fri, 28 Oct 2022 10:40:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a170902f20c00b00186e2123506sm3262526plc.300.2022.10.28.10.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:40:37 -0700 (PDT)
Date: Fri, 28 Oct 2022 10:40:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: LSM stacking in next for 6.1?
Message-ID: <202210280944.AF75E37DC@keescook>
References: <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
 <CAHC9VhQy91eezWMQ=MoLe3fQSu_Rc+ZUWW2Mm3+78Mr7vS_Z0A@mail.gmail.com>
 <a0567b10-fa83-50f4-7bf6-937e0c677e60@I-love.SAKURA.ne.jp>
 <CAHC9VhT2Azg1F-G3RQ4xL7JgA3OAtHafzS1_nvUyEUFsCJ9+SA@mail.gmail.com>
 <56add81d-0ea7-9d3e-0e30-e0b02e62a8d0@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
In-Reply-To: <56add81d-0ea7-9d3e-0e30-e0b02e62a8d0@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 28 Oct 2022 17:41:27 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 28, 2022 at 10:58:30PM +0900, Tetsuo Handa wrote:
> Do you remember that 10 modules were proposed 
> 
>     SimpleFlow ( 2016/04/21 https://lwn.net/Articles/684825/ )
>     HardChroot ( 2016/07/29 https://lwn.net/Articles/695984/ )
>     Checmate ( 2016/08/04 https://lwn.net/Articles/696344/ )
>     LandLock ( 2016/08/25 https://lwn.net/Articles/698226/ )
>     PTAGS ( 2016/09/29 https://lwn.net/Articles/702639/ )
>     CaitSith ( 2016/10/21 https://lwn.net/Articles/704262/ )
>     SafeName ( 2016/05/03 https://lwn.net/Articles/686021/ )
>     WhiteEgret ( 2017/05/30 https://lwn.net/Articles/724192/ )
>     shebang ( 2017/06/09 https://lwn.net/Articles/725285/ )
>     S.A.R.A. ( 2017/06/13 https://lwn.net/Articles/725230/ )

There was also:

      LoadPin ( 2016/04/20 https://lore.kernel.org/lkml/1461192388-13900-1-git-send-email-keescook@chromium.org/ )
      SafeSetID ( 2018/10/31 https://lore.kernel.org/linux-security-module/20181031152846.234791-1-mortonm@chromium.org/ )
      BPF ( 2019/09/10 https://lore.kernel.org/linux-security-module/20190910115527.5235-1-kpsingh@chromium.org/ )

So, 13 LSM proposed, 4 landed: roughly 30%, which is on par[1] with regular
kernel development.

> I consider /sbin/insmod-able LSM modules as a compromise/remedy for LSM modules
> which could not get merged upstream or supported by distributors, for patching and
> rebuilding the whole kernel in order to use not-yet-upstreamed and/or not-builtin
> LSMs is already a lot of barrier for users. But requiring a permanent integer in
> order to use a LSM module is a denial of even patching and rebuilding the whole
> kernel. That's why I hate this change.

But the upstream kernel _does not support APIs for out-of-tree code_. To
that point, security_add_hooks() is _not exported_, so it is already not
possible to create a modular LSM without patching the kernel source.

> I can't understand why assigning a permanent integer identifier is mandatory.

Plenty of other APIs use numeric identifiers: syscalls, prctl, etc. This
doesn't block them from being upstreamed.

-Kees

[1] https://ieeexplore.ieee.org/abstract/document/6624016

-- 
Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

