Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EFA61228B18
	for <lists+linux-audit@lfdr.de>; Tue, 21 Jul 2020 23:25:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-JKzxD3vhMq6BNKHN3Uuw8w-1; Tue, 21 Jul 2020 17:24:57 -0400
X-MC-Unique: JKzxD3vhMq6BNKHN3Uuw8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA7991273;
	Tue, 21 Jul 2020 21:24:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 040F18731D;
	Tue, 21 Jul 2020 21:24:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0E57180954D;
	Tue, 21 Jul 2020 21:24:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LLGgNL007134 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 17:16:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CFBD2166BA2; Tue, 21 Jul 2020 21:16:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 785922166BA0
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 21:16:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F4BA83B7F9
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 21:16:40 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-e5Iv3r2sOSa2oo5BNk5_4Q-1; Tue, 21 Jul 2020 17:16:37 -0400
X-MC-Unique: e5Iv3r2sOSa2oo5BNk5_4Q-1
Received: by mail-ej1-f65.google.com with SMTP id a21so23043947ejj.10
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 14:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PpobAsBikcZzGgFnqaofvkVdzW58Lh6D10Z7oCD2icY=;
	b=keXtHk04IwsmM9At/nq0d938u2nV5exf8SsSvdYsCr5wY6L8OrYov93Mq2PP1zz1UZ
	4DeGC7MzN2CTQChmNp1ZNVcIHO77NfeOTlURkiPmsOpbWcMAfnRHofOrCL5aVmJq8OZT
	JXlYFBueApjnCmMflzybyj5P1PrNHoD/B16LtiXUPQjdWVjM7IhzJKYFppgfqMbuA5Rm
	uZYz/txCZOBKigfYV3vthhDmwMC/n6Qx/znaKZbLvEIq5aWVVQ2D9OxjLQXUiLURiH2z
	FG9R4S3aBSUoZF2gDZKgLVUuhPDXw1w3IEfa/041ertiOlJCiGHhXHo5tgT5bUczW/u7
	nvbA==
X-Gm-Message-State: AOAM532aypEc4UjaPzSiaUrTyn41km26kSkqhwIO9QrugYXCjZc/Cwta
	ieJ+Uu+Xfea9Zo5Z0fClFeTuedDkTDHfEcagUApX
X-Google-Smtp-Source: ABdhPJyY2Ce5NqMGMBhWAGWwnzWTH0+myvH3o2aHnpLX7WPIWCXYWZRi2c+CytjWBqS3on7CikdMRT1S93rvuO3HPGc=
X-Received: by 2002:a17:906:1a59:: with SMTP id
	j25mr25594636ejf.398.1595366195416; 
	Tue, 21 Jul 2020 14:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <6effbbd4574407d6af21162e57d9102d5f8b02ed.1594664015.git.rgb@redhat.com>
	<CAHC9VhSyq7yKQqwvHL5syU9+TFki6-__WfCrvqewbnU3xpND4Q@mail.gmail.com>
	<20200714174353.ds7lj3iisy67t2zu@madcap2.tricolour.ca>
	<CAHC9VhQusQsdQc7EfdjdH5mp6qqqYVPHnG9nNhUhf3DS_cdWwA@mail.gmail.com>
	<20200714210027.me2ieywjfcsf4v5r@madcap2.tricolour.ca>
	<CAHC9VhQgDGPutYxQawMPmezm1a+i1nXO5KSn9_7KPDZsRBJ4pw@mail.gmail.com>
	<e6eb37d5-ec6b-852a-74df-bbf453607fbe@canonical.com>
In-Reply-To: <e6eb37d5-ec6b-852a-74df-bbf453607fbe@canonical.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 Jul 2020 17:16:24 -0400
Message-ID: <CAHC9VhSoUBqXh7ikVdpr9-e2+3Wx-A05g5EBjD3ka1i1xF2vMg@mail.gmail.com>
Subject: Re: [PATCH ghak84 v4] audit: purge audit_log_string from the
	intra-kernel audit API
To: John Johansen <john.johansen@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 21, 2020 at 3:31 PM John Johansen
<john.johansen@canonical.com> wrote:
> On 7/21/20 8:19 AM, Paul Moore wrote:
> > On Tue, Jul 14, 2020 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> On 2020-07-14 16:29, Paul Moore wrote:
> >>> On Tue, Jul 14, 2020 at 1:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >>>> On 2020-07-14 12:21, Paul Moore wrote:
> >>>>> On Mon, Jul 13, 2020 at 3:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >>>>>>
> >>>>>> audit_log_string() was inteded to be an internal audit function and
> >>>>>> since there are only two internal uses, remove them.  Purge all external
> >>>>>> uses of it by restructuring code to use an existing audit_log_format()
> >>>>>> or using audit_log_format().
> >>>>>>
> >>>>>> Please see the upstream issue
> >>>>>> https://github.com/linux-audit/audit-kernel/issues/84
> >>>>>>
> >>>>>> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >>>>>> ---
> >>>>>> Passes audit-testsuite.
> >>>>>>
> >>>>>> Changelog:
> >>>>>> v4
> >>>>>> - use double quotes in all replaced audit_log_string() calls
> >>>>>>
> >>>>>> v3
> >>>>>> - fix two warning: non-void function does not return a value in all control paths
> >>>>>>         Reported-by: kernel test robot <lkp@intel.com>
> >>>>>>
> >>>>>> v2
> >>>>>> - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
> >>>>>>
> >>>>>> v1 Vlad Dronov
> >>>>>> - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
> >>>>>>
> >>>>>>  include/linux/audit.h     |  5 -----
> >>>>>>  kernel/audit.c            |  4 ++--
> >>>>>>  security/apparmor/audit.c | 10 ++++------
> >>>>>>  security/apparmor/file.c  | 25 +++++++------------------
> >>>>>>  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
> >>>>>>  security/apparmor/net.c   | 14 ++++++++------
> >>>>>>  security/lsm_audit.c      |  4 ++--
> >>>>>>  7 files changed, 46 insertions(+), 62 deletions(-)
> >>>>>
> >>>>> Thanks for restoring the quotes, just one question below ...
> >>>>>
> >>>>>> diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> >>>>>> index 4ecedffbdd33..fe36d112aad9 100644
> >>>>>> --- a/security/apparmor/ipc.c
> >>>>>> +++ b/security/apparmor/ipc.c
> >>>>>> @@ -20,25 +20,23 @@
> >>>>>>
> >>>>>>  /**
> >>>>>>   * audit_ptrace_mask - convert mask to permission string
> >>>>>> - * @buffer: buffer to write string to (NOT NULL)
> >>>>>>   * @mask: permission mask to convert
> >>>>>> + *
> >>>>>> + * Returns: pointer to static string
> >>>>>>   */
> >>>>>> -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> >>>>>> +static const char *audit_ptrace_mask(u32 mask)
> >>>>>>  {
> >>>>>>         switch (mask) {
> >>>>>>         case MAY_READ:
> >>>>>> -               audit_log_string(ab, "read");
> >>>>>> -               break;
> >>>>>> +               return "read";
> >>>>>>         case MAY_WRITE:
> >>>>>> -               audit_log_string(ab, "trace");
> >>>>>> -               break;
> >>>>>> +               return "trace";
> >>>>>>         case AA_MAY_BE_READ:
> >>>>>> -               audit_log_string(ab, "readby");
> >>>>>> -               break;
> >>>>>> +               return "readby";
> >>>>>>         case AA_MAY_BE_TRACED:
> >>>>>> -               audit_log_string(ab, "tracedby");
> >>>>>> -               break;
> >>>>>> +               return "tracedby";
> >>>>>>         }
> >>>>>> +       return "";
> >>>>>
> >>>>> Are we okay with this returning an empty string ("") in this case?
> >>>>> Should it be a question mark ("?")?
> >>>>>
> >>>>> My guess is that userspace parsing should be okay since it still has
> >>>>> quotes, I'm just not sure if we wanted to use a question mark as we do
> >>>>> in other cases where the field value is empty/unknown.
> >>>>
> >>>> Previously, it would have been an empty value, not even double quotes.
> >>>> "?" might be an improvement.
> >>>
> >>> Did you want to fix that now in this patch, or leave it to later?  As
> >>> I said above, I'm not too bothered by it with the quotes so either way
> >>> is fine by me.
> >>
> >> I'd defer to Steve, otherwise I'd say leave it, since there wasn't
> >> anything there before and this makes that more evident.
> >>
> >>> John, I'm assuming you are okay with this patch?
> >
> > With no comments from John or Steve in the past week, I've gone ahead
> > and merged the patch into audit/next.
>
> sorry, for some reason I thought a new iteration of this was coming.
>
> the patch is fine, the empty unknown value should be possible here
> so changing it to "?" won't affect anything.

Yeah, I was kind of on the fence about requiring a new version from
Richard.  I think "?" is arguably the right approach, but I don't
think it matters enough to force the issue.  If it proves to be
problematic we can fix it later.

Regardless, it's in audit/next now.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

