Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A5F7122B716
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jul 2020 22:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595534479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y6SWj9ihemApJuDu4VDMTY4PP2ZGGRERNRgYLbk2Bi0=;
	b=BLOtQZggzZtg0kPMLID/+jnHVzOPBtEGxIbMbSUg+Y8e5oviDAkcTVNwcoFJMPpFPg8/iF
	JF4oZWXRDqrfQYLfBrnIsTYlMhuX7SQZCvBeBQpwaKJF2G+w9cMKC7vwj89vBbwIFH5mGe
	CVxqgTMC6c8WdNDWHRUNlOuoiQvgnXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-H572XY1LMSi2Jpyf8ub1Lg-1; Thu, 23 Jul 2020 16:01:16 -0400
X-MC-Unique: H572XY1LMSi2Jpyf8ub1Lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8625B18C63C2;
	Thu, 23 Jul 2020 20:01:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4FE8512FE;
	Thu, 23 Jul 2020 20:01:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11B489A157;
	Thu, 23 Jul 2020 20:01:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NK0qEp017543 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 16:00:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9E245C1D3; Thu, 23 Jul 2020 20:00:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1EB95C1BD;
	Thu, 23 Jul 2020 20:00:44 +0000 (UTC)
Date: Thu, 23 Jul 2020 16:00:41 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: bauen1 <j2468h@googlemail.com>
Subject: Re: null pointer dereference regression in 5.7
Message-ID: <20200723200041.7yinlklts47pzmfm@madcap2.tricolour.ca>
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<20200722194740.qqz7iya3nrqs3a3w@madcap2.tricolour.ca>
	<dedbf8ae-bc44-ab03-b7d4-2f724e516210@defensec.nl>
	<20200723124703.3upv2dykfekxbb3w@madcap2.tricolour.ca>
	<f724ccc0-5cee-abbc-b44c-d8574fba988e@defensec.nl>
	<4bee5a4a-cb1b-6db7-6c41-fb5221b5363c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4bee5a4a-cb1b-6db7-6c41-fb5221b5363c@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, Dominick Grift <dominick.grift@defensec.nl>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-23 15:10, bauen1 wrote:
> On 7/23/20 2:58 PM, Dominick Grift wrote:
> > On 7/23/20 2:47 PM, Richard Guy Briggs wrote:
> >> On 2020-07-22 22:04, Dominick Grift wrote:
> >>> On 7/22/20 9:47 PM, Richard Guy Briggs wrote:
> >>>> On 2020-07-18 20:56, Dominick Grift wrote:
> >>>>> On 7/18/20 8:40 PM, bauen1 wrote:
> >>>>>> Hi,
> >>>>>> After upgrading from linux 5.6 to 5.7 on my debian machines with selinux I've started seeing this null pointer dereference in the audit system. I've included shortened logs for 5.6 without the error and from 5.7 with the error from my laptop. I've also seen it happen in a VM and a server, but don't have the logs anymore. Grift was able to reproduced (presumably) the same issue on fedora with 5.8-rc4.
> >>>>>>
> >>>>>> Steps to reproduce:
> >>>>>> Write an selinux policy with a domain for systemd-user-runtime-dir and audit all permissions of the dir class. E.g. `(auditallow systemd_user_runtime_dir_t all_types (dir (all)))`
> >>>>>> Switch to permissive mode.
> >>>>>> Create a new user and login, log out and wait a few seconds for systemd to stop user-runtime-dir@<uid>.service
> >>>>>
> >>>>> This should be a reproducer:
> >>>>>
> >>>>> echo "(auditallow systemd_logind_t file_type (dir (all)))" > mytest.cil
> >>>>> && sudo semodule -i mytest.cil
> >>>>> reboot
> >>>>
> >>>> Is this recipe complete?  Is permissive mode needed?  Is the user
> >>>> create/login/logout needed?
> >>>
> >>> Are you saying you can't reproduce it?
> >>
> >> Not yet.  This run caused a queue overflow but no pointer dereference.
> >>
> >>> It *should* be complete yes. with kernel 5.7/5.8 it should oops when you
> >>> reboot.
> >>
> >> I don't understand what this test does to cause an AVC.  I assume we
> >> want the smiplest test that produces the smallest amount of output but
> >> certain to trigger the event.
> > 
> > Yes that is the idea, my test was a bit broader but i based this
> > conversion of the test on bauen1's test which is a bit more narrow ( i
> > think he managed to narrow it down a bit). Maybe this test is a bit to
> > narrow and a bit broader version triggers i>>
> >> Since this test is in place on reboot, how do I remove this test for
> >> subsequent reboots?
> >>
> > 
> > You would boot with selinux=0 and then run as root `semodule -n -r
> > mytest' to unload the offending mytest module without trying to reload.
> > 
> > then reboot with selinux enforcing/permissive (you might end up with
> > some mis and/or unlabeled files)
> > 
> >>> I will admit though that I adjusted the reproducer a little bit in an
> >>> attempt to make it fit fedora.
> >>
> >> I'm running the test on f32.  I have 5 kernels that should blow up and
> >> two that might be fine with the ghak96 LSM_AUDIT_DATA_* audit_getpwd() fix.
> >>
> >>> So if it doesnt oops for you and if you use 5.7/5.8 then maybe the
> >>> reproducer got mangled in the conversion.
> >>
> >> Can you explain the mechanism and the conversion?
> > 
> > I use my own selinux security policy with different identifiers, so to
> > make my test work on Fedora I figured I just needed to translate the
> > identifiers applicable in my policy to the identifiers applicable in Fedora.
> > 
> > Basically it boils down to this:
> > The event was triggered by systemd-user-runtime-dir (which in fedora is
> > associated with type identifier systemd_logind_t) on particual (i
> > suspect) directory operations (like i guess "traverse"), when the event
> > is logged even if its granted. So I tried to express that scenario using
> > fedora identifiers rather than the ones I use.
> > 
> 
> The actual permission checks that cause the audit event are probably (dir (search remove_name rmdir)), in refpolicy syntax `dir { search remove_name rmdir };`.
> It doesn't really matter how the audit event is generated (permissive mode and denying access or enforcing and auditing allows).
> I've reproduced it with systemd version 245.6-1 on a debian system with gnupg installed. Having something like gnupg installed is important as it creates its own directory under /run/user/uid that is accessed by systemd-user-runtime-dir after log out.

Ok, I've reproduced it on the kernels that have that ghak120 patch and
the two newer kernels with the ghak96 patch in addition do not have the
problem, so the upstream audit/next is safe from your reproducer.

That still leaves auditing the code for other potential dangers.

> bauen1

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

