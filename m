Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA49731F289
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 23:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613688733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y2Bhh/mzh0LW5crzpn9nYR1Q/qzHf0TvmPb0Z94ACBk=;
	b=PIzIUS4MpwyCRCCZdrbqRFhBKF/W47OOjbhF9ETNVDLCUGjsV2XO5sSyZTsMEavMGCefdL
	UlmmhZLzR1z4pT4Bu9ZmnRU8x65Qk+El5Pc0x8UPmPYKqv+PkVwSrZ9zu1iYp3G5Kdcs6I
	yLVUVvx4mIs2rP04vJG+VHyR2Fg1Ck8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-8oS3Ed6bM2mKyXFAJ4dmhA-1; Thu, 18 Feb 2021 17:52:11 -0500
X-MC-Unique: 8oS3Ed6bM2mKyXFAJ4dmhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9BF8030B7;
	Thu, 18 Feb 2021 22:52:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC5446F94F;
	Thu, 18 Feb 2021 22:52:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D7D34E58D;
	Thu, 18 Feb 2021 22:52:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IMouwq020249 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 17:50:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 93C7617DC3; Thu, 18 Feb 2021 22:50:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-115-136.rdu2.redhat.com [10.10.115.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11D1A60877;
	Thu, 18 Feb 2021 22:50:52 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-audit@redhat.com
Subject: Re: security_task_getsecid() and subjective vs objective task creds
Date: Thu, 18 Feb 2021 17:50:51 -0500
Message-ID: <806848326.0ifERbkFSE@x2>
Organization: Red Hat
In-Reply-To: <5f8a424a-2aab-f11a-0e06-f8f075c644f6@schaufler-ca.com>
References: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
	<5f8a424a-2aab-f11a-0e06-f8f075c644f6@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, February 18, 2021 5:07:52 PM EST Casey Schaufler wrote:
> On 2/18/2021 11:34 AM, Paul Moore wrote:
> > Hi all,
> > 
> > When looking into a problem I noticed that audit was recording the
> > wrong subject label for a process.  Doing a bit of digging I realized
> > this was caused by the SELinux security_task_getsecid() implementation
> > returning the objective security label (taken from task->real_cred),
> > and not the subjective security label (taken from task->cred).
> > 
> > Looking around at the other LSMs which implement this hook, Smack and
> > AppArmor, it appears they both do the same thing: return the objective
> > security ID for the process.  Looking quickly at the various non-LSM
> > callers of the security_task_getsecid() hook, it unfortunately looks
> > like all of them expect the subjective security ID to be returned.
> > The only caller I'm not 100% confident in is binder, but from what I
> > can tell it looks like they are expecting the subjective ID too.
> > 
> > At least we are consistently wrong :)
> 
> We may have come down with a case of helperitis.
> 
> > How do we want to fix this?  The obvious fix is to change the SELinux,
> > AppArmor, and Smack security_task_getsecid() implementations to return
> > the subjective security ID (->cred), and likely make a note in
> > lsm_hooks.h,
> 
> That would be my choice.
> 
> >  but if someone can see a case where we would need both
> > 
> > the subjective and objective security labels speak up and we can
> > introduce a new hook for the subjective label, and likely add a "_obj"
> > to the end of the existing hook to help make it more clear.  If
> > neither of those options are acceptable, we could convert all of the
> > existing callers to use something like the line below (assumes
> > current), but that is the least appealing option as far as I'm
> > concerned.
> > 
> >   security_cred_getsecid(current_cred(), &sid);
> > 
> > Opinions?
> 
> If the objective cred isn't being used in the access control decision
> it seems pointless to add it to the audit record. If there is a case
> where the task is being treated as an object, signal delivery comes to
> mind, you still want the objective credential. So it seems like care
> may be required to ensure that the correct value (sub vs obj) is
> used.

Yes, ptrace, process_vm_readv, process_vm_writev, pidfd_open, 
process_madvise, pidfd_send_signal all seem to operate on a different process 
and might be candidates for an OBJ_PID record which is where it would get 
recorded.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

