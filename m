Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E86B237
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 01:10:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DEB030917AB;
	Tue, 16 Jul 2019 23:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0B3C5D968;
	Tue, 16 Jul 2019 23:09:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D54C74EA31;
	Tue, 16 Jul 2019 23:09:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GN9fwV004583 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 19:09:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEE6260BEE; Tue, 16 Jul 2019 23:09:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E7360A9F
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 23:09:39 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 050FD3082E1E
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 23:09:38 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id x3so15015665lfc.0
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=50E+D8RNg2pkL4Nfrd2jVn+hIK2jQ9NMYZfs4HmwmsQ=;
	b=gZG/61c8fdvJIPoSMDcxcVTzhmPQsGlidi7N/q0+vSVBaLuRW5ZCHcrUR+RIBbMj2w
	UOKTbakAuUN9yGKRZk12eXLUndlJh9l72lu5wT9NKXZ7uLPnp6678CMzNwzPON7HH+D+
	6NFcecb8L0nKT0aK7/5V4IhNB/YxSW/tR1jhUEbpcMIDnf+0aUM827kfdpInB+VSWUch
	2OdnHQd3RjpYnz+bfTJHxUY9JgGE7yPlrWuNBplJxwptDKNuGGNaKgJClqqqPPAvbFkv
	FuAljaKZvXDFrADCw0MN5moGHMZUacdGnsJJZSr62jfoZFNv4QuhwURKG3rsfzKwxFa6
	n+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=50E+D8RNg2pkL4Nfrd2jVn+hIK2jQ9NMYZfs4HmwmsQ=;
	b=Ge5naDZ5h0RY8CC5+/Gzm2LNWjoeGu1OtF6lll3vB6hD+/H9R2Y7f5ZVUfDnWpdRUV
	i51OzJfLJ0e9Xz6/ucjFbjiQLM3Z6COGwPHr5C2cOcqbJl0aXBsqtKCNE5lj6uU4tpY+
	dn5cfXfHNOmRjAxi3TOqLrnKD/XaptHsyH+/Rj1bSbmc101iJpThhG7gyRtgIbKNT/fC
	qcB15XcCQ7r+FsW1WUzs/+JDipX7KBMynwfXevBCtgM62gS+e3DliXS4lM1/FuPWpKqF
	U5t0Rwu0sIRz1K1pLgiH0tDK/3zjQ7VtbO+1fX6brEIlKpwsdjD00zqRyWTAoB5Br5LE
	Hb9A==
X-Gm-Message-State: APjAAAVRMbJtj6bShW0IQyVMJ9RVHDYnREMcyeo7ezvLHhEPompvlkYA
	ibBqLNS91BFGPwVpzZDYm0hEv8W0A8SmKniIrYefoXY=
X-Google-Smtp-Source: APXvYqz7uiL5oXkYo6/dnSeDDSWZts2/zfZfVBjVpZciqcpZ3swxXmA7fvF2nX8Joc7qHo1YMZswbGj5Vqr+rovszMc=
X-Received: by 2002:ac2:4c37:: with SMTP id u23mr2255723lfq.119.1563318576304; 
	Tue, 16 Jul 2019 16:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
In-Reply-To: <2517266.eHZzEmjMsX@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 19:09:25 -0400
Message-ID: <CAHC9VhS-WGuKYzG5AU01BN8tk8nzp+7qxk7Sz-hbHQGL+UXOfg@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 23:09:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 23:09:38 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 16 Jul 2019 23:09:59 +0000 (UTC)

On Tue, Jul 16, 2019 at 5:46 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Tuesday, July 16, 2019 5:25:21 PM EDT Paul Moore wrote:

...

> > Agreed.  While I'm not going to be on a specific Linux release, I do
> > believe that at some point in the future the LSM stacking work is
> > going to land in Linus' tree.  Perhaps you'll never see it Steve, but
> > we need to prepare the code to handle it when it happens.
>
> And I agree with that. I'm saying that if we push it all in subj= then it is
> not a big penalty.

I'm going to disagree on that quite severely.  As I mentioned
previously there isn't an easy or sane way to delimit between the
different LSM labels which means sorting out the multiplexed "subj"
field is going to be a post processing nightmare.

> It saves major breakage. Every single event is required to
> have a subj= field if its a MAC system.

All of the options we've discussed still record the LSM credentials in
the audit record; no one is talking about *not* recording the LSM
credentials.  What we are discussing is *how* they are recorded.

> By changing it to lsm_subj= it changes
> the layout of every single event. And it make more to parse. And searching
> the labels is worse because it has to iterate over a list of *_subj to match
> it. This will hurt performance because it is for every single event.

I can almost guarantee that looking for subj/subj_X is going to be
much easier than safely parsing a multiplexed subj field.  Not to
mention the multiplexed approach is just awful to read compared to
some of the other suggestions.

> > For my own sanity, here is a quick summary of the constraints as I
> > currently see them, please feel free to add/disagree:
> >
> > * We can't have multiple "subj" fields in a single audit record.
> > * The different LSMs all have different label formats and allowed
> > characters.  Further, a given label format may not be unique for a
> > given LSM; for example, Smack could be configured with a subset of
> > SELinux labels.
> > * Steve's audit tools appear to require a "subj" and "obj" fields for
> > LSM information or else they break into tiny little pieces.
>
> It changes all knowledge of where to look for things. And considering
> considering that events could be aggregated from systems of different ages/
> distributions, audit userspace will always have to be backwards compatible.

The subj_X approach is still backwards compatible, the difference is
that old versions of the tools get a "?" for the LSM creds which is a
rather sane way of indicating something is different.  The multiplexed
approach would result in effectively garbage for the LSM creds unless
the higher layers of audit tooling are updated to understand the new
multiplexed format *and* *continuously* *updated* as new LSMs are
stacked because you need to understand each LSMs label format if you
are going to safely parse the multiplexed format.  With the subj_X
approach the higher layer tooling simply needs to look for subj_X
fields when it sees "subj=?", and then it can safely extract/parse
each LSM's label without needing to understand or inspect the labels
themselves.

> > What if we preserved the existing subj/obj fields in the case where
> > there is only one "major" LSM (SELinux, Smack, AppArmor, etc.):
> >
> >   subj=<lsm_label>
> >
> > ... and in the case of multiple major LSMs we set the subj value to
> > "?" and introduce new subj_X fields (as necessary) as discussed above:
> >
> >   subj=? subj_smack=<smack_label> subj_selinux=<selinux_label> ...
> >
> > ... I believe that Steve's old/existing userspace tools would simply
> > report "?"/unknown LSM credentials where new multi-LSM tools could
> > report the multiple different labels.
>
> Common Criteria as well as other standards require subject labels to be
> searchable. So, changing behavior based on how many modules will still cause
> problems with performance because I'll always have to assume it could be
> either way and try both.

Once again, I believe that the subj_X approach is going to be faster
than safely parsing the multiplexed format.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
