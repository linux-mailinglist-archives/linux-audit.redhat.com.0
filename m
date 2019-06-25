Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0495206E
	for <lists+linux-audit@lfdr.de>; Tue, 25 Jun 2019 03:49:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D41A43082E1E;
	Tue, 25 Jun 2019 01:48:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E24165C22F;
	Tue, 25 Jun 2019 01:48:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC9E31806B18;
	Tue, 25 Jun 2019 01:48:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5P1lFRu011326 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 21:47:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 322AB60C62; Tue, 25 Jun 2019 01:47:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2A960C4C
	for <linux-audit@redhat.com>; Tue, 25 Jun 2019 01:47:12 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC2AF3083394
	for <linux-audit@redhat.com>; Tue, 25 Jun 2019 01:46:58 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 205so5710859ljj.8
	for <linux-audit@redhat.com>; Mon, 24 Jun 2019 18:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yY0buOnDBXDxAC7PLVBtYI3pFTakloh8+6q+akNwwUY=;
	b=18/XRgS968rYTsu5WnfR3Grv4B0yDOon1KV28UOCSURWf6rac6dp8hhq01n27l5NbQ
	8Kcv3CfoSX1LBTxjARXMnytBH/Uf07XHfAl4UafAaRDTxxzgPn+g6igK0PGm8YhgIV/R
	zDALb0Bagl+RcN/n1vm5lHGZhXGLVaQZIXxt49wp24/BXXwx0lSl0Wbb5DPxbycL3D2j
	ERaa9UinCF3CKKsJahIuE5w/yMeg6mPA58tm14Cvm3ApIincqpTjvVGgOe0yUEty7aGa
	gWBamm7HPnIPYXKJ+1uufJcQsCI3ZZKCH9w4y79SWDGOmie3goPCqB55qfrcq3/3FbHa
	hoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yY0buOnDBXDxAC7PLVBtYI3pFTakloh8+6q+akNwwUY=;
	b=qRhZQqx+uPmVuYqR9jZVbtcQ23wX0EwSmOrdVYTJ99ncKvzSa9k6otaCiQ7jBFmIFr
	GxjHGiBTmOpAA9EyC2ecSc2ouXZcmKO8EfKNPVP2EraHHzJKi3o1/fVD9C1yLL0TJUEm
	HrTpyiXzoEigT0pkv3+4uCifryIP+Q0WqCFYfEE+BDlpwegY0sq6cU0N970GqAGjP1X/
	TXGHM3dHjMWsqe+NYsegLoNy0woTooUUjRZHWkPpZL4UABiTWBR5tHSl4XGo4LoPnESc
	K8Ht6cVplyalNJjFdHGrdoqONTv0PK2SPZGNGzu9SfaH09X6t1dHvJaW3G0QnMm6Pzl6
	Do4w==
X-Gm-Message-State: APjAAAWKmSJJnMM7zUBRCu41izP04WCrMyK7tVtN+8X4ADVP8Ey1oLhL
	NE0LZOi38Mj84qZHVgqDvBxIeeNCjzNJ7u5XxsoF
X-Google-Smtp-Source: APXvYqyV/UzNQSyh+uB8UzCU+XP/BX5eQeH5sbBsCUpkW/mXyKWYTvAtmGJKvqMSchug0I0CRMz2KcfEpE1NyKE/iMs=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr72395341lje.46.1561427217178; 
	Mon, 24 Jun 2019 18:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190621185233.6766-1-casey@schaufler-ca.com>
	<20190621185233.6766-22-casey@schaufler-ca.com>
	<79cd4a92-c221-eda4-58ba-730b5c2680d7@canonical.com>
	<0ad8f906-16ff-61af-ce7c-0ea1e9760d03@schaufler-ca.com>
In-Reply-To: <0ad8f906-16ff-61af-ce7c-0ea1e9760d03@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Jun 2019 21:46:45 -0400
Message-ID: <CAHC9VhSSwCY8L71x4WTr7kJhF1f_oyQ1NcwyXCAgW7ruKACQdQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] Audit: Store LSM audit information in an lsmblob
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 25 Jun 2019 01:46:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 25 Jun 2019 01:46:59 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.192  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 25 Jun 2019 01:49:10 +0000 (UTC)

On Mon, Jun 24, 2019 at 9:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 6/24/2019 2:33 PM, John Johansen wrote:
> > On 6/21/19 11:52 AM, Casey Schaufler wrote:
> >> Change the audit code to store full lsmblob data instead of
> >> a single u32 secid. This allows for multiple security modules
> >> to use the audit system at the same time. It also allows the
> >> removal of scaffolding code that was included during the
> >> revision of LSM interfaces.
> >>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> > I know Kees raised this too, but I haven't seen a reply
> >
> > Eric (Paul is already CCed): I have directly added you because of
> > the question below.
> >
> > In summary there isn't necessarily a single secid any more, and
> > we need to know whether dropping the logging of the secid or
> > logging all secids is the correct action.
>
> It is to be considered that this is an error case. If
> everything is working normally you should have produced
> a secctx previously, which you'll have included in the
> audit record. Including the secid in the record ought to
> be pointless, as the secid is strictly an internal token
> with no meaning outside the running kernel. You are providing
> no security relevant information by providing the secid.
> I will grant the possibility that the secid might be useful
> in debugging, but for that a pr_warn is more appropriate
> than a field in the audit record.

FWIW, this probably should have been CC'd to the audit list.

I agree that this is an error case (security_secid_to_secctx() failed
to resolve the secid) and further that logging the secid, or a
collection of secids, has little value the way things currently work.
Since secids are a private kernel implementation detail, we don't
really display them outside the context of the kernel, including in
the audit logs.  Recording a secid in this case doesn't provide
anything meaningful since secids aren't recorded in the audit record
stream, only the secctxs, and there is no "magic decoder ring" to go
between the two in the audit logs, or anywhere else in userspace for
that matter.

> >> ---
> >>  kernel/audit.h   |  6 +++---
> >>  kernel/auditsc.c | 38 +++++++++++---------------------------
> >>  2 files changed, 14 insertions(+), 30 deletions(-)

...

> >> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> >> index 0478680cd0a8..d3ad13f11788 100644
> >> --- a/kernel/auditsc.c
> >> +++ b/kernel/auditsc.c
> >> @@ -1187,21 +1184,18 @@ static void show_special(struct audit_context *context, int *call_panic)
> >>                              context->socketcall.args[i]);
> >>              break; }
> >>      case AUDIT_IPC: {
> >> -            u32 osid = context->ipc.osid;
> >> +            struct lsmblob *olsm = &context->ipc.olsm;
> >>
> >>              audit_log_format(ab, "ouid=%u ogid=%u mode=%#ho",
> >>                               from_kuid(&init_user_ns, context->ipc.uid),
> >>                               from_kgid(&init_user_ns, context->ipc.gid),
> >>                               context->ipc.mode);
> >> -            if (osid) {
> >> +            if (lsmblob_is_set(olsm)) {
> >>                      struct lsmcontext lsmcxt;
> >> -                    struct lsmblob blob;
> >>
> >> -                    lsmblob_init(&blob, osid);
> >> -                    if (security_secid_to_secctx(&blob, &lsmcxt)) {
> >> -                            audit_log_format(ab, " osid=%u", osid);
> > I am not comfortable just dropping this I would think logging all secids is the
> > correct action here.
> >
> >
> >> +                    if (security_secid_to_secctx(olsm, &lsmcxt))
> >>                              *call_panic = 1;
> >> -                    } else {
> >> +                    else {
> >>                              audit_log_format(ab, " obj=%s", lsmcxt.context);
> >>                              security_release_secctx(&lsmcxt);
> >>                      }

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
