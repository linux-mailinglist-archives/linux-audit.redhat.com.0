Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05B8DFC3
	for <lists+linux-audit@lfdr.de>; Wed, 14 Aug 2019 23:28:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF33030BA1D2;
	Wed, 14 Aug 2019 21:28:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A72F119C68;
	Wed, 14 Aug 2019 21:28:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A9D52551C;
	Wed, 14 Aug 2019 21:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELRflk006303 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:27:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CAFF27BCC; Wed, 14 Aug 2019 21:27:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9751119C68
	for <linux-audit@redhat.com>; Wed, 14 Aug 2019 21:27:39 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECF2E30BA1C9
	for <linux-audit@redhat.com>; Wed, 14 Aug 2019 21:27:37 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l14so444065ljj.9
	for <linux-audit@redhat.com>; Wed, 14 Aug 2019 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V3TpFpRi0M1RwfdvAwI2tYimAESwdWDgx768WWqxoi4=;
	b=tBf9o+MX8jdK8by+BXTemCH0gD9inUwT+pDV8I76QChixin1SuzGHEMwh01erS5e1z
	Bh3Wk9wmr0OOJLCl20r2+jWPAEezS6/MHH+OblSE+ad7M9f4TEfylY+2q3IPOQMIFSIl
	NQwnyybFcvSjRgD1W0HI9BDHNT5FY6poBqARftKyAG32YcMHBSjVRIsAaQFFWIg6gOQg
	E9+IJfemUwztP26SB1VbbbaX+tFBDoTHtqmjlpOdS2r2uRtiYag9STkg+BXa+aUz3MCb
	mloMl4uEMK3HhaVjeG2DsIu/fL/FmLV4Cem2xxU/C3OQNK7uCt7mgDSz7kzjhnbkvUR9
	hbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V3TpFpRi0M1RwfdvAwI2tYimAESwdWDgx768WWqxoi4=;
	b=U/QY+2yvGP6v3VMwYnD6kY5H+W6ci+INocsPcAW8uLMK57n3jEt4/SWJ9+dXmwVLDn
	x+ur0F4DWQZKEjfKWsIH8JfU1NE7aXhnRjjzT7O24QDB3kSsdTYG+/WQssq8IR7QiGtr
	kXmOwQoykGP3seKWQXAjUHEnwITIWBHNg3nuxvOCHcuTOxax9TQB/epuSdnssTQAV0hN
	hU26dvZY56RTwFMw76C9dSzSDdAKj52kZWJA/z7b1/cCnUwrgHWIwzIYVNQC9Y7hGPVL
	tsSafomy9ftLFY9mXv7GdywTMpvzbfkbEYShYG43WW5N7lK1LHvFg5XA4kwTRI+dT1e5
	A2rw==
X-Gm-Message-State: APjAAAUvWml8JXJt3pmhhe0bZqt0rWGTwLt0UwPPwzGo9fwZQPlUq5WG
	vaXWIgu+GlTf4YVYbHJ1hfzlCJLp0SJ7mY24lToQiOs=
X-Google-Smtp-Source: APXvYqztHpkIYq84oml9yq5j4N3sFWyz1A6opLc9i5YErWEbYApGzzCfeUR8yi6WhuMLCln8Rovh98aUya+/eejeZV4=
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr954989ljq.0.1565818056212; 
	Wed, 14 Aug 2019 14:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190801144313.1014-1-acgoide@tycho.nsa.gov>
	<CAHC9VhTSWiz45vh+M+sgu+ePwgFPZ4Mr8GmRZQjsGWQSzkjbLg@mail.gmail.com>
	<b79617aa-2b40-40bf-9f35-0f5be8e34d3f@tycho.nsa.gov>
	<20190813212710.wimxgfunrijqwuqt@madcap2.tricolour.ca>
	<CAHC9VhTWY4vtsmCn8X3TjR1HdsB1-wqBLs03vZVv0SmWQ-Ab2Q@mail.gmail.com>
	<b47e07bc-1b01-c5f0-305d-e6fe014b00d8@tycho.nsa.gov>
In-Reply-To: <b47e07bc-1b01-c5f0-305d-e6fe014b00d8@tycho.nsa.gov>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 14 Aug 2019 17:27:24 -0400
Message-ID: <CAHC9VhRzz52bVwMikM7C65vCCSLb0=y1HtB50o-H0G3AMHqRNw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] security,
	capability: pass object information to security_capable
To: Stephen Smalley <sds@tycho.nsa.gov>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 14 Aug 2019 21:27:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 14 Aug 2019 21:27:38 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.404  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com,
	Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>,
	Aaron Goidel <acgoide@tycho.nsa.gov>, luto@amacapital.net,
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Serge Hallyn <serge@hallyn.com>,
	Nicholas Franck <nhfran2@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 14 Aug 2019 21:28:32 +0000 (UTC)

On Wed, Aug 14, 2019 at 5:08 PM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 8/14/19 3:59 PM, Paul Moore wrote:
> > On Tue, Aug 13, 2019 at 5:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> On 2019-08-13 11:01, Aaron Goidel wrote:
> >>> On 8/8/19 12:30 PM, Paul Moore wrote:
> >>>> On Thu, Aug 1, 2019 at 10:43 AM Aaron Goidel <acgoide@tycho.nsa.gov> wrote:
> >>>>> From: Nicholas Franck <nhfran2@tycho.nsa.gov>
> >>>>>
> >>>>> At present security_capable does not pass any object information
> >>>>> and therefore can neither audit the particular object nor take it
> >>>>> into account. Augment the security_capable interface to support
> >>>>> passing supplementary data. Use this facility initially to convey
> >>>>> the inode for capability checks relevant to inodes. This only
> >>>>> addresses capable_wrt_inode_uidgid calls; other capability checks
> >>>>> relevant to inodes will be addressed in subsequent changes. In the
> >>>>> future, this will be further extended to pass object information for
> >>>>> other capability checks such as the target task for CAP_KILL.
> >>>>>
> >>>>> In SELinux this new information is leveraged here to include the inode
> >>>>> in the audit message. In the future, it could also be used to perform
> >>>>> a per inode capability checks.
> >>>>>
> >>>>> It would be possible to fold the existing opts argument into this new
> >>>>> supplementary data structure. This was omitted from this change to
> >>>>> minimize changes.
> >>>>>
> >>>>> Signed-off-by: Nicholas Franck <nhfran2@tycho.nsa.gov>
> >>>>> Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
> >>>>> ---
> >>>>> v2:
> >>>>> - Changed order of audit prints so optional information comes second
> >>>>> ---
> >>>>>    include/linux/capability.h             |  7 ++++++
> >>>>>    include/linux/lsm_audit.h              |  5 +++-
> >>>>>    include/linux/lsm_hooks.h              |  3 ++-
> >>>>>    include/linux/security.h               | 23 +++++++++++++-----
> >>>>>    kernel/capability.c                    | 33 ++++++++++++++++++--------
> >>>>>    kernel/seccomp.c                       |  2 +-
> >>>>>    security/apparmor/capability.c         |  8 ++++---
> >>>>>    security/apparmor/include/capability.h |  4 +++-
> >>>>>    security/apparmor/ipc.c                |  2 +-
> >>>>>    security/apparmor/lsm.c                |  5 ++--
> >>>>>    security/apparmor/resource.c           |  2 +-
> >>>>>    security/commoncap.c                   | 11 +++++----
> >>>>>    security/lsm_audit.c                   | 21 ++++++++++++++--
> >>>>>    security/safesetid/lsm.c               |  3 ++-
> >>>>>    security/security.c                    |  5 ++--
> >>>>>    security/selinux/hooks.c               | 20 +++++++++-------
> >>>>>    security/smack/smack_access.c          |  2 +-
> >>>>>    17 files changed, 110 insertions(+), 46 deletions(-)
> >>>>
> >>>> You should CC the linux-audit list, I've added them on this mail.
> >>>>
> >>>> I had hoped to see some thought put into the idea of dynamically
> >>>> emitting the proper audit records as I mentioned in the previous patch
> >>>> set, but regardless there are some comments on this code as written
> >>>> ...
> >>>>
> >>>>> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> >>>>> index 33028c098ef3..18cc7c956b69 100644
> >>>>> --- a/security/lsm_audit.c
> >>>>> +++ b/security/lsm_audit.c
> >>>>> @@ -229,9 +229,26 @@ static void dump_common_audit_data(struct audit_buffer *ab,
> >>>>>           case LSM_AUDIT_DATA_IPC:
> >>>>>                   audit_log_format(ab, " key=%d ", a->u.ipc_id);
> >>>>>                   break;
> >>>>> -       case LSM_AUDIT_DATA_CAP:
> >>>>> -               audit_log_format(ab, " capability=%d ", a->u.cap);
> >>>>> +       case LSM_AUDIT_DATA_CAP: {
> >>>>> +               const struct inode *inode;
> >>>>> +
> >>>>> +               audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
> >>>>> +               if (a->u.cap_struct.cad) {
> >>>>> +                       switch (a->u.cap_struct.cad->type) {
> >>>>> +                       case CAP_AUX_DATA_INODE: {
> >>>>> +                               inode = a->u.cap_struct.cad->u.inode;
> >>>>> +
> >>>>> +                               audit_log_format(ab, " dev=");
> >>>>> +                               audit_log_untrustedstring(ab,
> >>>>> +                                       inode->i_sb->s_id);
> >>>>> +                               audit_log_format(ab, " ino=%lu",
> >>>>> +                                       inode->i_ino);
> >>>>> +                               break;
> >>>>> +                       }
> >>>>
> >>>> Since you are declaring "inode" further up, there doesn't appear to be
> >>>> any need for the CAP_AUX_DATA_INODE braces, please remove them.
> >>>>
> >>>> The general recommended practice when it comes to "sometimes" fields
> >>>> in an audit record, is to always record them in the record, but use a
> >>>> value of "?" when there is nothing relevant to record.  For example,
> >>>> when *not* recording inode information you would do something like the
> >>>> following:
> >>>>
> >>>>     audit_log_format(ab, " dev=? ino=?");
> >>>>
> >>> The issue this brings up is what happens when this is expanded to more
> >>> cases? Assuming there will be a case here for logging audit data for task
> >>> based capabilities (CAP_AUX_DATA_TASK), what do we want to have happen if we
> >>> are recording *neither* inode information nor task information (say a PID)?
> >>> If we log something in the inode case, we presumably don't want to call
> >>> audit_log_format(ab, " dev=?, pid=?") as well. (And vice versa for when we
> >>> log a pid and no inode).
> >>
> >> Yup.  This record is already a mess due to that.
> >>
> >> The general solution is to either use a new record type for each
> >> variant, or to use an auxiliary record for each additional piece of
> >> information.  The long term solution that has been suggested it to move
> >> away from a text message format.
> >
> > This is why I was suggesting that Aaron look into allowing the LSMs to
> > request generation of audit records in the earlier thread (and
> > mentioned it again at the top of my comments in this thread).
>
> How would that work? The behavior we want is to capture some information
> about the inode whenever there is a capability denial upon an attempted
> access to that inode.  Allowing the LSM to enable audit collection on a
> per-process basis doesn't appear to help with that goal, because this is
> something we want for all processes.  Further, we don't really want the
> rest of the audit collection machinery engaged here ...

I read this as "we want to audit this information, but we don't to
turn on the very thing which is designed to do this".  At some point,
if you want to audit things, you actually need to turn on auditing.

> ... we just want the
> inode information for this specific inode, and we have the inode readily
> accessible in the caller of the LSM hook already, so we don't need to do
> it earlier.

Aaron appeared to be complaining that if we stuck to the current best
practices regarding record formatting for the LSM generated audit
record, the record was going to get complicated when people started
adding additional information.  FWIW, I don't disagree.  The only real
alternative I've seen thus far is to look into having the LSM enable
certain records, if anyone has another idea I'm all ears/eyes.

> Further, in the future we want to be able to take the inode security
> label into consideration as part of the capability checking, which is
> independent of audit entirely.  So the rest of the patch will still be
> required even if the audit solution ends up being different.

That's a different topic, I don't think there are any remaining
objections to passing the inode information here.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
