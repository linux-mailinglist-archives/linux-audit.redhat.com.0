Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FC6B114
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 23:26:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9DB0307D848;
	Tue, 16 Jul 2019 21:26:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 529A01001B18;
	Tue, 16 Jul 2019 21:26:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 698921800207;
	Tue, 16 Jul 2019 21:25:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GLPco6021362 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 17:25:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C025100164A; Tue, 16 Jul 2019 21:25:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B021001B04
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 21:25:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0E5D3084242
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 21:25:34 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id r9so21429284ljg.5
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HLu2QS7jPdsPIdUdlCTEP+akEGDUkSiemEDJqgb+oDo=;
	b=q5Pml+W1wAl4L6H2nyzr2d4ovrQMOK6HoV/vm4A1YWYHFAt9S1/jxGtWwmJnaUqI5n
	TTLqba+RjmZ7hhslBuz+2IPVI/W2XWiCNg3QTphQDG8G3iv73+TKkH1pOeKHsH+rv09A
	osuj6nDalzYtfrxP+cgvDsLWkCSLAw1iFYKHnzilJ8fxbBlkGplgROPQp5mN0Pd1EoQn
	/WXWC0ZkUODNd3eRUhSbl8wLUpp6Mll6p4uZD1BllLg0QiEqI6+aFflRzJ1KrASOCe6+
	qj2sAdJN5KkgI0Sf9/2A3tK43rMxnUPjfdLTwHTAIVWwWWAGf97854tT1+NhlHh4B0j7
	AXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HLu2QS7jPdsPIdUdlCTEP+akEGDUkSiemEDJqgb+oDo=;
	b=KwS6FL3LrQYbEo1M0Fg7X1Ka26Dc1Wu5r4+/5/MizFlcOMjLkhN4XqbiXiulmTeoEr
	Dkk1gL99PE3K8YP/fy9u/7DXkt7yP2gmNaQPrRAOZHF5OusoKqsq1trFJFJ0ns9eZDQ7
	/pXGopIF5giOtNuVKojoIcZ/OuXDOS/5OQcqG4M0xeESVKyjYPtKjegJyv2fXw6O46yJ
	wj1p2jsPDfZaG0b8QlzjcI56iORsxuUV9IvFHb7UrY43LeK/I6G/foc+QpkXyvnJOcvX
	qL0I/kLj8mHilg7uc6iF03nvG4hI65RscweLOOLNzeLJG3J0a0AD6Uo0W2kqR3ztO6+u
	bSZw==
X-Gm-Message-State: APjAAAUQps8Kv+S78XnXMoschDcMV0oVeOrB+sNl0TYo0qbP1u6HEphH
	j/s3huAI8wOu63vWNO2l0FfZYkleiIXA6xVFkw==
X-Google-Smtp-Source: APXvYqwffhV7djgA1ztBwXL1BKJAC0M4l0j73YrEUwmOo/NKtwnZ2AsvDGqHRcXO6kxxPgXGPKXNXeWBalH4obg1DWY=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr18660869lja.85.1563312332818; 
	Tue, 16 Jul 2019 14:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c993f63a-7c2d-c6c8-cfa6-3cfba410770d@schaufler-ca.com>
	<CAHC9VhSTwvueKcK2yhckwayh9YGou7gt2Gny36DOTaNkrck+Mg@mail.gmail.com>
	<2477603.130G60v5SE@x2>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
In-Reply-To: <d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 17:25:21 -0400
Message-ID: <CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 16 Jul 2019 21:25:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 16 Jul 2019 21:25:35 +0000 (UTC) for IP:'209.85.208.180'
	DOMAIN:'mail-lj1-f180.google.com'
	HELO:'mail-lj1-f180.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.180 mail-lj1-f180.google.com 209.85.208.180
	mail-lj1-f180.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 16 Jul 2019 21:26:05 +0000 (UTC)

On Tue, Jul 16, 2019 at 2:41 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/16/2019 11:06 AM, Steve Grubb wrote:
> > On Tuesday, July 16, 2019 1:43:18 PM EDT Paul Moore wrote:
> >> On Tue, Jul 16, 2019 at 1:30 PM Casey Schaufler <casey@schaufler-ca.com>
> > wrote:
> >>> On 7/16/2019 10:12 AM, Paul Moore wrote:
> >>>> On Mon, Jul 15, 2019 at 6:56 PM Steve Grubb <sgrubb@redhat.com> wrote:
> >>>>> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
> >>>>>> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler
> >>>>>> <casey@schaufler-ca.com>
> >>>>> wrote:
> >>>>>>> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> >>>>>>>> On 2019-07-13 11:08, Steve Grubb wrote:
> >>>> ...
> >>>>
> >>>>>>>> Steve's answer is the obvious one, ideally allocating a seperate
> >>>>>>>> range
> >>>>>>>> to each LSM with each message type having its own well defined
> >>>>>>>> format.
> >>>>>>> It doesn't address the issue of success records, or records
> >>>>>>> generated outside the security modules.
> >>>>>> Yes, exactly.  The individual LSM will presumably will continue to
> >>>>>> generate their own audit records as they do today and I would imagine
> >>>>>> that the subject and object fields could remain as they do today for
> >>>>>> the LSM specific records.
> >>>>>>
> >>>>>> The trick is the other records which are not LSM specific but still
> >>>>>> want to include subject and/or object information.  Unfortunately we
> >>>>>> are stuck with some tough limitations given the current audit record
> >>>>>> format and Steve's audit userspace tools;
> >>>>> Not really. We just need to approach the problem thinking about how to
> >>>>> make it work based on how things currently work.
> >>>> I suppose it is all somewhat "subjective" - bad joke fully intended :)
> >>>> - with respect to what one considers good/bad/limiting.  My personal
> >>>> view is that an ideal solution would allow for multiple independent
> >>>> subj/obj labels without having to multiplex on a single subj/obj
> >>>> field.  My gut feeling is that this would confuse your tools, yes?
> >>>>
> >>>>> For example Casey had a list of possible formats. Like this one:
> >>>>>
> >>>>> Option 3:
> >>>>>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
> >>>>>
> >>>>> I'd suggest something almost like that. The first field could be a map
> >>>>> to
> >>>>> decipher the labels. Then we could have a comma separated list of
> >>>>> labels.
> >>>>>
> >>>>> lsms=selinux,apparmor subj=x:y:z:s:c,a
> >>>> Some quick comments:
> >>>>
> >>>> * My usual reminder that new fields for existing audit records must be
> >>>> added to the end of the record.
> >>>>
> >>>> * If we are going to multiplex the labels on a single field (more on
> >>>> that below) I might suggest using "subj_lsms" instead of "lsms" so we
> >>>> leave ourself some wiggle room in the future.
> >>>>
> >>>> * Multiplexing on a single "subj" field is going to be difficult
> >>>> because picking the label delimiter is going to be a pain.  For
> >>>> example, in the example above a comma is used, which at the very least
> >>>> is a valid part of a SELinux label and I suspect for Smack as well
> >>>> (I'm not sure about the other LSMs).  I suspect the only way to parse
> >>>> out the component labels would be to have knowledge of the LSMs in
> >>>> use, as well as the policies loaded at the time the audit record was
> >>>> generated.
> >>>>
> >>>> This may be a faulty assumption, but assuming your tools will fall
> >>>> over if they see multiple "subj" fields, could we do something like
> >>>>
> >>>> the following (something between option #2 and #3):
> >>>>   subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
> >>>>
> >>>> subj2=<selinux_label> ...
> >>> If it's not a subj= field why use the indirection?
> >>>
> >>>         subj_smack=<smack_label> subj_selinux=<selinux_label>
> >>>
> >>> would be easier.
> >>
> >> Good point, that looks reasonable to me.
> >
> > But doing something like this will totally break all parsers. To be honest, I
> > don't know if I'll ever see more than one labeled security system running at
> > the same time. And this would be a big penalty to pay for the flexibility that
> > someone, somewhere just might possibly do this.
>
> While I have never seen multiple-LSM plans from RedHat/IBM I
> have seen them from Ubuntu. This isn't hypothetical. I know that
> it's a hard problem, which is why we need to get it as right as
> possible.

Agreed.  While I'm not going to be on a specific Linux release, I do
believe that at some point in the future the LSM stacking work is
going to land in Linus' tree.  Perhaps you'll never see it Steve, but
we need to prepare the code to handle it when it happens.

For my own sanity, here is a quick summary of the constraints as I
currently see them, please feel free to add/disagree:

* We can't have multiple "subj" fields in a single audit record.
* The different LSMs all have different label formats and allowed
characters.  Further, a given label format may not be unique for a
given LSM; for example, Smack could be configured with a subset of
SELinux labels.
* Steve's audit tools appear to require a "subj" and "obj" fields for
LSM information or else they break into tiny little pieces.

What if we preserved the existing subj/obj fields in the case where
there is only one "major" LSM (SELinux, Smack, AppArmor, etc.):

  subj=<lsm_label>

... and in the case of multiple major LSMs we set the subj value to
"?" and introduce new subj_X fields (as necessary) as discussed above:

  subj=? subj_smack=<smack_label> subj_selinux=<selinux_label> ...

... I believe that Steve's old/existing userspace tools would simply
report "?"/unknown LSM credentials where new multi-LSM tools could
report the multiple different labels.  While this may not be perfect,
it avoids having to multiplex the different labels into a single field
(which is a big win IMHO) with the only issue being that multi-LSM
solutions will need an updated audit toolset to see the new labels
(which seems like a reasonable requirement).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
