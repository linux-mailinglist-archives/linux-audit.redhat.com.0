Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6C2DDCE
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 15:14:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B692830253F2;
	Wed, 29 May 2019 13:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4711001E71;
	Wed, 29 May 2019 13:13:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA7D61806B14;
	Wed, 29 May 2019 13:12:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TDBww9005231 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 09:11:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD8FA6A979; Wed, 29 May 2019 13:11:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A632217AC2
	for <linux-audit@redhat.com>; Wed, 29 May 2019 13:11:56 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93D1DC06C9DA
	for <linux-audit@redhat.com>; Wed, 29 May 2019 13:11:48 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m15so2358247ljg.13
	for <linux-audit@redhat.com>; Wed, 29 May 2019 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SjmySxL3R2DPVPMEf4TWr1wlf43XjMJB++/RveVbXzc=;
	b=tXApFsCUwVyjATLbkMgyzaeynvvlum8Q3fphQsmDCYf3E+0iuNZIV9UN2EdfBGHS5I
	q6QA35RCxEkR7GEBkrIsuo85ZNPKGdNkN9gPxT7D2LSiBgE8pXjnlc/99X2LZrzPIUF0
	1s9qO4x0b8hH9zGRXgVG93m0xDo9D+edr6/iGWHL1wt3Wu3PMpty3EGFiW3OEYWzQj9L
	dzPOgU0D3ytwrClBoFslSfs5Kjw7KAlR/5IUogUkGYt4/cZML9OWxXTz01hNnKQheGHF
	1MesTZrMO1V69DSyONgG22kRaN0YqQ/3QJEk6zOzIuptz864wZCbINHGdLzfELz8fV5a
	J9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SjmySxL3R2DPVPMEf4TWr1wlf43XjMJB++/RveVbXzc=;
	b=lfgXA++rZkMthMXUkz6pfYt89gQgLaqmefnCxWewMwLKDowt01/JsZXFg7026/Z03K
	kfrkBywtxlf2OPrjEx1Pz1NtyRQToALSkzIBXKAbFSZLGVIL0F8PaavgsoxQoffJyClv
	X6Z1DhVJLxYlCeoqPKY3qKmaPmAo6ORmU/ZVJWD8pHvFt6jGlI/UWgLBZe6SgRtIWjpa
	Izf8hpMTleXzx4C07g7hwiZd+XoJcUpm+8ut0d3NH7Eaah7+6rV9gzWWeUZ7top8m9wX
	/F5RtCHgtMs5s6zo5q4fEZkr6tkx/HV4iKbiVii88eX+feNUYNu1UfmRdILCbubgFhbM
	VI1Q==
X-Gm-Message-State: APjAAAW2p5OVP7oUXHVS933DZ8SJfBcQLMi6tUUF7ZzXMDIQE4IAt+rt
	OgkL7u5G+WIaBmMfZ4y1eCG1lQMqOPTHibSfsOGg
X-Google-Smtp-Source: APXvYqx+PsxjdSVkBCwyIIkjvJUGSy1EZ6F7JHVyJ3BXUcw8WXMhj0ubBgXJJuEdSX+98HjB3W9QKoEjEvOYyXrfanU=
X-Received: by 2002:a2e:3e14:: with SMTP id l20mr52722297lja.40.1559135497219; 
	Wed, 29 May 2019 06:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <2fd85f3efc5a8816483497a84c1e031ee56d4ebf.1558553100.git.rgb@redhat.com>
	<CAHC9VhQ09UQV+mg4HRhMuWFV+7sX_XqhwPMpfO2oUTSD4Bup+A@mail.gmail.com>
	<20190528222228.uaexdwummj64ndof@madcap2.tricolour.ca>
In-Reply-To: <20190528222228.uaexdwummj64ndof@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 09:11:25 -0400
Message-ID: <CAHC9VhRy1Wg1i9LkZrVhKZvGVkkbNjcxTt4FmNQ1dPgehGs3TA@mail.gmail.com>
Subject: Re: [PATCH ghak114 V1] audit: enforce op for string fields
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 29 May 2019 13:11:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 29 May 2019 13:11:48 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 29 May 2019 13:14:01 +0000 (UTC)

On Tue, May 28, 2019 at 6:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-28 18:00, Paul Moore wrote:
> > On Wed, May 22, 2019 at 5:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > The field operator is ignored on several string fields.  WATCH, DIR,
> > > PERM and FILETYPE field operators are completely ignored and meaningless
> > > since the op is not referenced in audit_filter_rules().  Range and
> > > bitwise operators are already addressed in ghak73.
> > >
> > > Honour the operator for WATCH, DIR, PERM, FILETYPE fields as is done in
> > > the EXE field.
> > >
> > > Please see github issue
> > > https://github.com/linux-audit/audit-kernel/issues/114
> > > ---
> > >  kernel/auditsc.c | 18 +++++++++++++++---
> > >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > While the patch looks fine, it is missing your sign-off.  If you reply
> > to this thread with it, I'll go ahead and add to the patch when
> > merging.
>
> GHAK!  Sorry about that!
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>
> It passed checkpatch.pl when that code was in the ghak73 patch.  :-)

Yeah, but that means nothing when you post it as a separate patch.  I
don't really want an explanation of your workflow, I'm just asking you
to spend some time and sort it out, especially since I think this has
happened at least once before (a split patch not being checked).  The
missing sign-off is relatively harmless and easily fixed, but the
omission hints that perhaps the normal checks/testing are not being
done before posting and that is what worries me.

Anyway, it's now merged into audit/next with the proper sign-offs.

> > I'm sure everyone is tired of hearing me complain about people not
> > checking their patches, but this is something that would have been
> > caught by running ./scripts/checkpatch.pl against your patch (the
> > entire patch, not just the code portion).  If you aren't running your
> > full patch through checkpatch already, it is easy to do (there are
> > likely other ways too, these are just the two that I use):
> >
> > * using git
> > # git format-patch --stdout -1 <commit_id> | ./scripts/checkpatch.pl -
> >
> > * using stgit (my favorite)
> > # stg export -s <patch> | ./scripts/checkpatch.pl -
>
> Nice, it even works for a series...

Yes, stgit isn't for everyone, but it is easily one of my favorite
development tools (despite a few annoying quirks).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
