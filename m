Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1C68F194
	for <lists+linux-audit@lfdr.de>; Wed,  8 Feb 2023 16:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675868679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=suJUsMK8BjZ05A2Z5n0FLugPtTjDU2rJdCMuZ04rwo8=;
	b=NNwmZxcm0ymOm/OUk1aFv0s6g9yr07MMy8UL8/yY7sFEVFSqQkmospW7zCnFxYpFUa6V6P
	HUKWw9rZdPqegctxZOhrTq9r7XSbYMIwpNfcu5YI+v6qZWKXAffs2Kg9W2Lrii6Hmv7eTh
	9MZBfQN6O3PRyH7ktchgQEcN0mgz97k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-HElkXpr2MP-m0NIFxb5GkQ-1; Wed, 08 Feb 2023 10:04:34 -0500
X-MC-Unique: HElkXpr2MP-m0NIFxb5GkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5DDE18E5381;
	Wed,  8 Feb 2023 15:04:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D06B492B00;
	Wed,  8 Feb 2023 15:04:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 075BF19465A0;
	Wed,  8 Feb 2023 15:04:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A492F1946589 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Feb 2023 15:04:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 554801121315; Wed,  8 Feb 2023 15:04:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD601121314
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 15:04:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1245F85A588
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 15:04:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-7MiSVgODOuiSt5NxUQgGmA-1; Wed, 08 Feb 2023 10:03:42 -0500
X-MC-Unique: 7MiSVgODOuiSt5NxUQgGmA-1
Received: by mail-pl1-f177.google.com with SMTP id e19so11638268plc.9
 for <linux-audit@redhat.com>; Wed, 08 Feb 2023 07:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675868616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ihjiwlEnazSLR/Xo/oRVwpb499pD51aqltyWYJGNkVs=;
 b=bm0kGZVOG9zEWPDWTgyQKMJts7DYVSyFIPF/avAUvcyYeRV8jrLeNu+VCx9J3YCtcB
 1YaYlFbQQOEwkre1Mil8+2WIxNLibEbHxOdFaXRoIlEGUrYp6RdsRLAPKN0WZZyWnHuJ
 kGbTcKLL22TQu5ItAC7Ty9aY9r9U5OeJNoBsZaokzJnSRWQze2a43puZh0PBpL5v623s
 vP+HTBo6fNPXRbgHawtYQw/8xXKxQHv7Jgk+H7iJvE7alfuyf0BbiYxnTaezmd/grTRm
 P7HnhcJ9wi+Gprew0q7pp/uVc1QCW/4UEtz3z4k0UlSa8OThIOPdL1OKgrLyqfrl92N7
 gEyw==
X-Gm-Message-State: AO0yUKWlaDKZVL5lWUYVD6GgE6GUHspBr2ymFOwFxLdsF7zipGyiQSpK
 q26FvO5w6l9GeM+HSlQHpMHVX3pMnhx6qYriTM/WcMxaqlVs
X-Google-Smtp-Source: AK7set97wwwjEmTxETvTco6NkGr3kzx4BNOLzV+BA5GR23v21B97EbMG5opdpR48Q4SRlmodujmSwcXTaNhKjoLZ+B4=
X-Received: by 2002:a17:903:2796:b0:199:1faa:1b75 with SMTP id
 jw22-20020a170903279600b001991faa1b75mr1889595plb.32.1675868616002; Wed, 08
 Feb 2023 07:03:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675373475.git.rgb@redhat.com>
 <20230207120921.7pgh6uxs7ze7hkjo@quack3>
 <CAHC9VhQuD0UMYd12x9kOMwruDmQsyUFxQ8gJ3Q_qF6a58Lu+2Q@mail.gmail.com>
 <20230208120816.2qhck3sb7u67vsib@quack3>
In-Reply-To: <20230208120816.2qhck3sb7u67vsib@quack3>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Feb 2023 10:03:24 -0500
Message-ID: <CAHC9VhSumNxmoYQ9JPtBgV0dc1fgR38Lqbo0w4PRxhvBdS=W_w@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 8, 2023 at 7:08 AM Jan Kara <jack@suse.cz> wrote:
> On Tue 07-02-23 09:54:11, Paul Moore wrote:
> > On Tue, Feb 7, 2023 at 7:09 AM Jan Kara <jack@suse.cz> wrote:
> > > On Fri 03-02-23 16:35:13, Richard Guy Briggs wrote:
> > > > The Fanotify API can be used for access control by requesting permission
> > > > event notification. The user space tooling that uses it may have a
> > > > complicated policy that inherently contains additional context for the
> > > > decision. If this information were available in the audit trail, policy
> > > > writers can close the loop on debugging policy. Also, if this additional
> > > > information were available, it would enable the creation of tools that
> > > > can suggest changes to the policy similar to how audit2allow can help
> > > > refine labeled security.
> > > >
> > > > This patchset defines a new flag (FAN_INFO) and new extensions that
> > > > define additional information which are appended after the response
> > > > structure returned from user space on a permission event.  The appended
> > > > information is organized with headers containing a type and size that
> > > > can be delegated to interested subsystems.  One new information type is
> > > > defined to audit the triggering rule number.
> > > >
> > > > A newer kernel will work with an older userspace and an older kernel
> > > > will behave as expected and reject a newer userspace, leaving it up to
> > > > the newer userspace to test appropriately and adapt as necessary.  This
> > > > is done by providing a a fully-formed FAN_INFO extension but setting the
> > > > fd to FAN_NOFD.  On a capable kernel, it will succeed but issue no audit
> > > > record, whereas on an older kernel it will fail.
> > > >
> > > > The audit function was updated to log the additional information in the
> > > > AUDIT_FANOTIFY record. The following are examples of the new record
> > > > format:
> > > >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
> > > >   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=0 subj_trust=2 obj_trust=2
> > >
> > > Thanks! I've applied this series to my tree.
> >
> > While I think this version of the patchset is fine, for future
> > reference it would have been nice if you had waited for my ACK on
> > patch 3/3; while Steve maintains his userspace tools, I'm the one
> > responsible for maintaining the Linux Kernel's audit subsystem.
>
> Aha, I'm sorry for that. I had the impression that on the last version of
> the series you've said you don't see anything for which the series should
> be respun so once Steve's objections where addressed and you were silent
> for a few days, I thought you consider the thing settled... My bad.

That's understandable, especially given inconsistencies across
subsystems.  If it helps, if I'm going to ACK something I make it
explicit with a proper 'Acked-by: ...' line in my reply; if I say
something looks good but there is no explicit ACK, there is usually
something outstanding that needs to be resolved, e.g. questions,
additional testing, etc.

In this particular case I posed some questions in that thread and
never saw a reply with any answers, hence the lack of an ACK.  While I
think the patches were reasonable, I withheld my ACK until the
questions were answered ... which they never were from what I can
tell, we just saw a new patchset with changes.

/me shrugs

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

