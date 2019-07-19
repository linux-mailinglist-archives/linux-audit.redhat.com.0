Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A26906EC07
	for <lists+linux-audit@lfdr.de>; Fri, 19 Jul 2019 23:22:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B716B30C1E28;
	Fri, 19 Jul 2019 21:22:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAB6C619AA;
	Fri, 19 Jul 2019 21:22:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72CDC1800206;
	Fri, 19 Jul 2019 21:22:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JLMGS3020255 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 17:22:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD89219C68; Fri, 19 Jul 2019 21:22:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B88E619936
	for <linux-audit@redhat.com>; Fri, 19 Jul 2019 21:22:14 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4AD330BB7F1
	for <linux-audit@redhat.com>; Fri, 19 Jul 2019 21:22:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p17so32053920ljg.1
	for <linux-audit@redhat.com>; Fri, 19 Jul 2019 14:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KmyIx3tRb/tlcUVPTSOrwnPlwWKZg8Em0s+OM8jX8mI=;
	b=n95Gc178eFcY2xnjYB5CgYvzAJGwYVBwb4KlO97D+AV45meU9rJzJ6K6LAL/fQgs/H
	jSnOI29QFKbgXqF5eqP4lgLijrLvfzvl1j56g81dK6S0vqSTwSdxhj58sBQBQpqgBGG/
	5yt37H9y7lH1RTsCUnfvFHtnSp6f2wB/yiFvPSH0k5o2Cy/azLVEp3OyVzi0BWMle/4k
	GHQX1TVzdH2h5xYYQO6GhISVzz9inHjjpTwWia6e1ejAt5n+WuT5Y0Ve3vFakidnDnxB
	qX5smBBO46hQlwvLOwRQUA7jD26AB2tlbUpjIxXJsNOhQAycSf6OL6nRp2MnW6MIJCbh
	9UvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KmyIx3tRb/tlcUVPTSOrwnPlwWKZg8Em0s+OM8jX8mI=;
	b=Ya3LkLsLdwpg3Z9JcildGzsD/glxIvM60KE5ZxTC3PGIauF3niJo2uCQubGpATmMmz
	apucNU3rvdUEYEIoRZ1IJKvEWTDvGD2Jmcr8Diu76JH1FcJJ6LH4hGK2uqL1mw37yp4c
	00eFofCmubAKJjOJRBJbLtYWJNb8qZPKeYjp4xF1jNn9TwLSoXHmis5R/0ER8G1f9z5I
	c6tSEgXUASoEu87QUWaLtUK+KU44xZj9K0LxP8VRjXp70Nsmxun9Q23DVFoQTnTxYisT
	3Poossz0I8J0Nhr1KLG8RgTdBN+Vod2HoyaWG846w5sMWK8ue0OPJQOnQ3zD4QNzH+kg
	B+bA==
X-Gm-Message-State: APjAAAVHj5RZylJN4KB0n9vBmubMHnC3HC05x75u7BeP+/6ueA/7dgzV
	naYFHYkuJbYlz/ujUE0Z4D9LVo2PsHarEnVSliPHy5Q=
X-Google-Smtp-Source: APXvYqxTbwQCTR5hYf1qyFYRX5A72KKEmIRlHouK+WfC+E33TShZ6S7z0CO7DF9IYhLBPGs5qdCe1cLcDQOij/GJ70M=
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr29852522ljj.129.1563571330913; 
	Fri, 19 Jul 2019 14:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
	<CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
In-Reply-To: <f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 19 Jul 2019 17:21:58 -0400
Message-ID: <CAHC9VhTf0yYDZBxOtfv2E5=GtrBYonoqr46hyBy7qdNdjVLoVg@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 19 Jul 2019 21:22:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 19 Jul 2019 21:22:13 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 19 Jul 2019 21:22:33 +0000 (UTC)

On Wed, Jul 17, 2019 at 7:02 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/17/2019 9:23 AM, Paul Moore wrote:
> > On Wed, Jul 17, 2019 at 11:49 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 7/17/2019 5:14 AM, Paul Moore wrote:
> >>> On Tue, Jul 16, 2019 at 7:47 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>> On 7/16/2019 4:13 PM, Paul Moore wrote:
> >>>>> On Tue, Jul 16, 2019 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>>>> It sounds as if some variant of the Hideous format:
> >>>>>>
> >>>>>>         subj=selinux='a:b:c:d',apparmor='z'
> >>>>>>         subj=selinux/a:b:c:d/apparmor/z
> >>>>>>         subj=(selinux)a:b:c:d/(apparmor)z
> >>>>>>
> >>>>>> would meet Steve's searchability requirements, but with significant
> >>>>>> parsing performance penalties.
> >>>>> I think "hideous format" sums it up nicely.  Whatever we choose here
> >>>>> we are likely going to be stuck with for some time and I'm near to
> >>>>> 100% that multiplexing the labels onto a single field is going to be a
> >>>>> disaster.
> >>>> If the requirement is that subj= be searchable I don't see much of
> >>>> an alternative to a Hideous format. If we can get past that, and say
> >>>> that all subj_* have to be searchable we can avoid that set of issues.
> >>>> Instead of:
> >>>>
> >>>>         s = strstr(source, "subj=")
> >>>>         search_after_subj(s, ...);
> >>> This example does a lot of hand waving in search_after_subj(...)
> >>> regarding parsing the multiplexed LSM label.  Unless we restrict the
> >>> LSM label formats (which seems both wrong, and too late IMHO)
> >> I don't think it's too late, and I think it would be healthy
> >> to restrict LSM "contexts" to character sets that make command
> >> line specification possible. Embedded newlines? Ewwww.
> > That would imply that the delimiter you would choose for the
> > multiplexed approach would be something odd (I think you suggested
> > 0x02, or similar, earlier) which would likely require the multiplexed
> > subj field to become a hex encoded field which would be very
> > unfortunate in my opinion and would technically break with the current
> > subj/obj field format spec.  Picking a normal-ish delimiter, and
> > restricting its use by LSMs seems wrong to me.
>
> Just say "no" to hex encoding!

Yes, it's best avoided.

> BTW, keys are not hex encoded.

The kernel keyring keys?  Not really relevant here I don't think.

> We've never had to think about having general rules on
> what security modules do before, because with only one
> active each could do whatever it wanted without fear of
> conflict. If there is already a character that none of
> the existing modules use, how would it be wrong to
> reserve it?

"We've never had to think about having general rules on what security
modules do before..."

We famously haven't imposed restrictions on the label format before
now, and this seems like a pretty poor reason to start.

> > It's important to remember that Steve's strstr() comment only reflects
> > his set of userspace tools.  When you start talking about log
> > aggregation and analytics, it seems very likely that there are other
> > tools in use, likely with their own parsers that do much more
> > complicated searches than a simple strstr() call.
>
> Point. But long term, they'll have to be updated to accommodate
> whatever we decide on. Which makes the "simple" case, where one
> security module is in use all the more important.

Both the multiplexed and subj_X proposals handle the single major LSM
case the same: identical to what we have now.  Regardless of how
important the single major LSM case may be, it isn't a distinguishing
factor in this discussion.

> >>>> we have
> >>>>
> >>>>         s = source
> >>>>         for (i = 0; i < lsm_slots ; i++) {
> >>>>                 s = strstr(s, "subj_")
> >>>>                 if (!s)
> >>>>                         break;
> >>>>                 s = search_after_subj_(s, lsm_slot_name[i], ...)
> >>> The hand waving here in search_after_subj_(...) is much less;
> >>> essentially you just match "subj_X" and then you can take the field
> >>> value as the LSM's label without having to know the format, the policy
> >>> loaded, etc.  It is both safer and doesn't require knowledge of the
> >>> LSMs (the LSM "name" can be specified as a parameter to the search
> >>> tool).
> >> You can do that with the Hideous format as well. I wouldn't
> >> say which would be easier without delving into the audit user
> >> space.
>
> > No, you can't.  You still need to parse the multiplexed mess, that's
> > the problem.
>
> You move the parsing problem to the record, where you have to
> look for subj_selinux= instead of having the parsing problem in
> the subj= field, where you look for something like selinux=
> within the field. Neither looks like the work of an afternoon to
> get right.

Finding subj_X in an audit record is no different than finding any
other field in a record.  Parsing the multiplexed label mess is a
whole different problem and prone to lots of mistakes.

> It probably looks like I'm arguing for the Hideous format option.
> That would require less work and code disruption, so it is tempting
> to push for it. But I would have to know the user space side a
> whole lot better than I do to feel good about pushing anything that
> isn't obviously a good choice. I kind of prefer Paul's "subj=?"
> approach, but as it's harder, I don't want to spend too much time
> on it if it gets me a big, juicy, well deserved NAK.

I didn't want to have to NAK this, but if that is what it is going to
take, so be it ... as it currently stands I'm NAK'ing the the
multiplexed approach.  You don't have to go with the subj_X approach,
but the multiplexed approach is a terrible idea and I can almost
guarantee that we would be regretting that choice in a few years time.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
