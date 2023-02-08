Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0068F321
	for <lists+linux-audit@lfdr.de>; Wed,  8 Feb 2023 17:25:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675873508;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ty3YcljilHw1h+5XV02Gt5r4oZPKIVtPOxWe8Ts3pwA=;
	b=NPvEiWrfht5hYVT6xo0t+DMLnb3tqvDfcWRNLROdlPxEviDrHd4urWosZ00aJbfpAk4qS4
	Dg6pltDKpe+XZ6zLKmNd6gCrPdmTQDDm9QZFYZ/u6l9VfN4uflApIzVwzJROklYxZocNy7
	EA6uyDKSqbtBo9t4x5VMJMoaKZAx3LM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-RX3Zcc1EOgWWLh4k1UwTwQ-1; Wed, 08 Feb 2023 11:25:07 -0500
X-MC-Unique: RX3Zcc1EOgWWLh4k1UwTwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62FB9381494F;
	Wed,  8 Feb 2023 16:25:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5422640398A0;
	Wed,  8 Feb 2023 16:24:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F01ED19465A2;
	Wed,  8 Feb 2023 16:24:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0DFEA1946589 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Feb 2023 16:24:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E4AE6404CD85; Wed,  8 Feb 2023 16:24:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0BC404CD84
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 16:24:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCF013C0D860
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 16:24:38 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-rJPL0b_SNHKHivR6zN2dUQ-1; Wed, 08 Feb 2023 11:24:34 -0500
X-MC-Unique: rJPL0b_SNHKHivR6zN2dUQ-1
Received: by mail-pg1-f180.google.com with SMTP id s8so10890589pgg.11
 for <linux-audit@redhat.com>; Wed, 08 Feb 2023 08:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5QZBwNZEGMpaQZL+RItnX9+RrhVVFdDL8hLibIYIFRQ=;
 b=KNxmw8XvQs73RzfgkSlvFnIWmZMSG0tghAXB8pmGXkMeNaTwRF/5uSQFt1LfICkYS6
 Na4uIbqyaSEkXbXE44WNyhEsN5tWfHexD9tUoWiJPB59f5otj/YqED01RjFN3KZCXLjE
 3cGePAwxYiUucgjgXq8U3+YYQygwbpQF/r76YTzGcIshApl0/2dNaMrvmx1ed0al7PxI
 tPVSo4zS4TWvSaQu9YMxKepuVcdafbQNnN6tZKkarwCE0WWIRXo7T22COejUHZOPPc3J
 0BlhPXX6WPvl4+aHWxK/W78YoVG4EEVqdKLoo599l5d1zYBpvpj6hK8x0UOqcMR9fmGD
 F58g==
X-Gm-Message-State: AO0yUKXU3wBEguzsUe/YcG3ivnGVL0iLyS976bOFSULN6KF9TsC4JCTE
 Ag7JwryAU/V1I8kgddXRnYrcex9F3hipGqoiyBlX
X-Google-Smtp-Source: AK7set9WlFaBqCNORMZ/MtBXsv1aS6hOrWsBpVZnP2fZuQOkIA7m8VhFW/MJusvpHxTKmRVoJCojHg6fu9Q91jymSL0=
X-Received: by 2002:a63:3544:0:b0:4f5:8a1b:7d0 with SMTP id
 c65-20020a633544000000b004f58a1b07d0mr1697887pga.88.1675873472991; Wed, 08
 Feb 2023 08:24:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675373475.git.rgb@redhat.com>
 <20230208120816.2qhck3sb7u67vsib@quack3>
 <CAHC9VhSumNxmoYQ9JPtBgV0dc1fgR38Lqbo0w4PRxhvBdS=W_w@mail.gmail.com>
 <5912195.lOV4Wx5bFT@x2>
In-Reply-To: <5912195.lOV4Wx5bFT@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Feb 2023 11:24:21 -0500
Message-ID: <CAHC9VhQnajhwOiW-0GvgnkPJ=QOTuLaYt2WBbm8vJoyEDso=2Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] fanotify: Allow user space to pass back additional
 audit info
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Jan Kara <jack@suse.cz>, Richard Guy Briggs <rgb@redhat.com>,
 linux-api@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 8, 2023 at 10:27 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Wednesday, February 8, 2023 10:03:24 AM EST Paul Moore wrote:
> > On Wed, Feb 8, 2023 at 7:08 AM Jan Kara <jack@suse.cz> wrote:
> > > On Tue 07-02-23 09:54:11, Paul Moore wrote:
> > > > On Tue, Feb 7, 2023 at 7:09 AM Jan Kara <jack@suse.cz> wrote:
> > > > > On Fri 03-02-23 16:35:13, Richard Guy Briggs wrote:
> > > > > > The Fanotify API can be used for access control by requesting
> > > > > > permission
> > > > > > event notification. The user space tooling that uses it may have a
> > > > > > complicated policy that inherently contains additional context for
> > > > > > the
> > > > > > decision. If this information were available in the audit trail,
> > > > > > policy
> > > > > > writers can close the loop on debugging policy. Also, if this
> > > > > > additional
> > > > > > information were available, it would enable the creation of tools
> > > > > > that
> > > > > > can suggest changes to the policy similar to how audit2allow can
> > > > > > help
> > > > > > refine labeled security.
> > > > > >
> > > > > > This patchset defines a new flag (FAN_INFO) and new extensions that
> > > > > > define additional information which are appended after the response
> > > > > > structure returned from user space on a permission event.  The
> > > > > > appended
> > > > > > information is organized with headers containing a type and size
> > > > > > that
> > > > > > can be delegated to interested subsystems.  One new information
> > > > > > type is
> > > > > > defined to audit the triggering rule number.
> > > > > >
> > > > > > A newer kernel will work with an older userspace and an older
> > > > > > kernel
> > > > > > will behave as expected and reject a newer userspace, leaving it up
> > > > > > to
> > > > > > the newer userspace to test appropriately and adapt as necessary.
> > > > > > This
> > > > > > is done by providing a a fully-formed FAN_INFO extension but
> > > > > > setting the
> > > > > > fd to FAN_NOFD.  On a capable kernel, it will succeed but issue no
> > > > > > audit
> > > > > > record, whereas on an older kernel it will fail.
> > > > > >
> > > > > > The audit function was updated to log the additional information in
> > > > > > the
> > > > > > AUDIT_FANOTIFY record. The following are examples of the new record
> > > > > >
> > > > > > format:
> > > > > >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1
> > > > > >   fan_info=3137 subj_trust=3 obj_trust=5 type=FANOTIFY
> > > > > >   msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=0
> > > > > >   subj_trust=2 obj_trust=2> > >
> > > > > Thanks! I've applied this series to my tree.
> > > >
> > > > While I think this version of the patchset is fine, for future
> > > > reference it would have been nice if you had waited for my ACK on
> > > > patch 3/3; while Steve maintains his userspace tools, I'm the one
> > > > responsible for maintaining the Linux Kernel's audit subsystem.
> > >
> > > Aha, I'm sorry for that. I had the impression that on the last version of
> > > the series you've said you don't see anything for which the series should
> > > be respun so once Steve's objections where addressed and you were silent
> > > for a few days, I thought you consider the thing settled... My bad.
> >
> > That's understandable, especially given inconsistencies across
> > subsystems.  If it helps, if I'm going to ACK something I make it
> > explicit with a proper 'Acked-by: ...' line in my reply; if I say
> > something looks good but there is no explicit ACK, there is usually
> > something outstanding that needs to be resolved, e.g. questions,
> > additional testing, etc.
> >
> > In this particular case I posed some questions in that thread and
> > never saw a reply with any answers, hence the lack of an ACK.  While I
> > think the patches were reasonable, I withheld my ACK until the
> > questions were answered ... which they never were from what I can
> > tell, we just saw a new patchset with changes.
> >
> > /me shrugs
>
> Paul,
>
> I reread the thread. You only had a request to change if/else to a switch
> construct only if there was a respin for the 3F. You otherwise said get
> Steve's input and the 3F borders on being overly clever. Both were addressed.
> If you had other questions that needed answers on, please restate them to
> expedite approval of this set of patches. As far as I can tell, all comments
> are addressed.

Steve,

It might be helpful to reread my reply below:

https://lore.kernel.org/linux-audit/CAHC9VhRWDD6Tk6AEmgoobBkcVKRYbVOte7-F0TGJD2dRk7NKxw@mail.gmail.com/

You'll see that I made a comment in that email about not following
Richard's explanation about "encoding the zero" (the patch was
encoding a "?" to the best I could tell).  I was hoping for some
clarification from Richard on his comments, and I never saw anything
in my inbox.  I just checked the archives on lore and I don't see
anything there either.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

