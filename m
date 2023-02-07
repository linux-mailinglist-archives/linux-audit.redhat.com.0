Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B268DC2C
	for <lists+linux-audit@lfdr.de>; Tue,  7 Feb 2023 15:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675781680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cZlJidOxiMY3zkubiEe6B0GhvqD5J8QJQ11aEwzLvLk=;
	b=hQjR00lAj6Pm46D8InWq7DLDYdXjJGAChwE2AEkWEd17MFufOCYWjYnq0Ed1SXPNDDoBz3
	YAI6SFslDQC33WOHoE39kpuB/9UgyDVIjvK+Ydh4dO9p2K3jcZgL86ppWjqUyl1z2HBWHr
	ulvAas7QaKmvkfAljwF43VK1GkmN5dE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-gFvA61jjOlGroXf2YS7w6g-1; Tue, 07 Feb 2023 09:54:38 -0500
X-MC-Unique: gFvA61jjOlGroXf2YS7w6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B14C857A87;
	Tue,  7 Feb 2023 14:54:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF1640398A0;
	Tue,  7 Feb 2023 14:54:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78B1E19465A2;
	Tue,  7 Feb 2023 14:54:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 459B61946589 for <linux-audit@listman.corp.redhat.com>;
 Tue,  7 Feb 2023 14:54:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3521A400EAB9; Tue,  7 Feb 2023 14:54:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDDD400DFDB
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 14:54:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11BD3183B3C3
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 14:54:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-LxcUL_wfP6ajV_Vu_F0uSA-1; Tue, 07 Feb 2023 09:54:23 -0500
X-MC-Unique: LxcUL_wfP6ajV_Vu_F0uSA-1
Received: by mail-pg1-f175.google.com with SMTP id a23so10582615pga.13
 for <linux-audit@redhat.com>; Tue, 07 Feb 2023 06:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/sFKKhZ90MQYN6W+lwU/csGafQQLGEIclrsug/GE52I=;
 b=Oha1lagzQzsbrWBK3HWQonBNoiI8zSbsShndr+bbCb6rVdeAStyXabXEB9EEipU1vN
 g7fGfOJY2iK7D4/P10fqbFevmDbqncfD1V0OKmnQmozCsWTM6b464SuMjQAsRS4D0Zu2
 Evv5ybhxHlGOxGB+HZJQrjXNQeAy5yLk/x61qR7jwHhvb/ydRT5jsagSXsaPW/zTuL9n
 D3fZmOxdY2G3nPLSUBMujZSIRbltG1he0GF9DRlbnGZ47eAj6Goi0u/kwF1F/5TdW1YR
 ttBKixQ/2xmIDDE2NLbvcRczU97id7l5tPNN+8YwbNxvh6v0nylwbUk4CH1tQSC/nLoT
 MD3w==
X-Gm-Message-State: AO0yUKX+o6WTPydv4LoAB+ySi4IfZbPMQvj3ViWNB73+w9n7ZkfaMuQ1
 YPJ6uqywwm8aB4Seo5Vw3bl+NkEcXSlYHSRJ3q7q
X-Google-Smtp-Source: AK7set/12SmTpGSfAsl0Qb15n4IkVg7Ti31+1DTyBVDLIOeevQ21dbZovK+nK1IW38jl/XJbAGuBV2UvWR9XWEQpqpw=
X-Received: by 2002:a62:18c6:0:b0:59c:3da0:1629 with SMTP id
 189-20020a6218c6000000b0059c3da01629mr760258pfy.6.1675781662291; Tue, 07 Feb
 2023 06:54:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675373475.git.rgb@redhat.com>
 <20230207120921.7pgh6uxs7ze7hkjo@quack3>
In-Reply-To: <20230207120921.7pgh6uxs7ze7hkjo@quack3>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Feb 2023 09:54:11 -0500
Message-ID: <CAHC9VhQuD0UMYd12x9kOMwruDmQsyUFxQ8gJ3Q_qF6a58Lu+2Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] fanotify: Allow user space to pass back additional
 audit info
To: Jan Kara <jack@suse.cz>
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 7, 2023 at 7:09 AM Jan Kara <jack@suse.cz> wrote:
> On Fri 03-02-23 16:35:13, Richard Guy Briggs wrote:
> > The Fanotify API can be used for access control by requesting permission
> > event notification. The user space tooling that uses it may have a
> > complicated policy that inherently contains additional context for the
> > decision. If this information were available in the audit trail, policy
> > writers can close the loop on debugging policy. Also, if this additional
> > information were available, it would enable the creation of tools that
> > can suggest changes to the policy similar to how audit2allow can help
> > refine labeled security.
> >
> > This patchset defines a new flag (FAN_INFO) and new extensions that
> > define additional information which are appended after the response
> > structure returned from user space on a permission event.  The appended
> > information is organized with headers containing a type and size that
> > can be delegated to interested subsystems.  One new information type is
> > defined to audit the triggering rule number.
> >
> > A newer kernel will work with an older userspace and an older kernel
> > will behave as expected and reject a newer userspace, leaving it up to
> > the newer userspace to test appropriately and adapt as necessary.  This
> > is done by providing a a fully-formed FAN_INFO extension but setting the
> > fd to FAN_NOFD.  On a capable kernel, it will succeed but issue no audit
> > record, whereas on an older kernel it will fail.
> >
> > The audit function was updated to log the additional information in the
> > AUDIT_FANOTIFY record. The following are examples of the new record
> > format:
> >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
> >   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=0 subj_trust=2 obj_trust=2
>
> Thanks! I've applied this series to my tree.

While I think this version of the patchset is fine, for future
reference it would have been nice if you had waited for my ACK on
patch 3/3; while Steve maintains his userspace tools, I'm the one
responsible for maintaining the Linux Kernel's audit subsystem.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

