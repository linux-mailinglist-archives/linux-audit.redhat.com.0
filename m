Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472F520B5
	for <lists+linux-audit@lfdr.de>; Tue, 25 Jun 2019 04:43:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 289A230821DF;
	Tue, 25 Jun 2019 02:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E9581001DEA;
	Tue, 25 Jun 2019 02:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52B133D87;
	Tue, 25 Jun 2019 02:43:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5P2gl6k023089 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 22:42:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50E5219722; Tue, 25 Jun 2019 02:42:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE4819936
	for <linux-audit@redhat.com>; Tue, 25 Jun 2019 02:42:43 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66D0C81F25
	for <linux-audit@redhat.com>; Tue, 25 Jun 2019 02:42:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p17so14634594ljg.1
	for <linux-audit@redhat.com>; Mon, 24 Jun 2019 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CKBE8eaoco4pGI763kC/y95/qX1Cg9WszVwNQiVM23M=;
	b=eymxPmIScDKLhyJTp2mEkUmTZp/oEzH5x6rUE6KoNYoVY6rRSLkd6UztBZnDlPUsT6
	Adara3v74FkG48l0SfVaDVjJjjWd2mjJ85XuRW42uD3bZx8WeaZmb4nfb/F/Al2RWagH
	n0m5vmZoySDwY6VZlyFAnxP4SSpWtPjJYpPR9jj66UuhG00QXsNLCaS+AGdT3raxwYNf
	TkQKKxteXJ3ZNGyl6Ro5K2FYpQr1OgFdg4oKZtjf6LoW6BTjJioLWXvI/WVKFz/w8RAo
	9EFeT3stuOS1Ioooh44u3gSc9uvWrYexzdeUgm0ptpcYVq13+PrZLYK1XLZc64H7LeGv
	IjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CKBE8eaoco4pGI763kC/y95/qX1Cg9WszVwNQiVM23M=;
	b=jLo6E3DMmgVqRHZnK3OgiEh0ZDAwTdkQgeFznTE/GDT0N8dTPbMz+Ik9ca1IN7/CBf
	fXTFCcprnJogfUb5t2JXgXhm3q49c6kNj/DtrHzrdxUBy6yASaj6lvTFKZ1r/ey2Fngj
	OZ8whzXja/RkLHre9obSbEka4T/Th6iFnInqO9eV2q60DDoR7g+EjsX+iONEf8JWodf9
	eWGLFnjVRBLcXd74b/CVVUFKPb9r58A/eI6IAxQdtXr5LIQvkMBf2USXnMZyU9bWwTy4
	8LgaJUFF6uFCbFiBLi+zVpFLjwXW6zw4Pzk3BXqJJ0Dm5csyIBQ54+MYQJ9AHz6xyqC8
	YmnQ==
X-Gm-Message-State: APjAAAVBirIxQG5xSBZq+H049MaA6SZNwH/rMG9pLn8qzJYWyCms+Dsv
	NeLizfD5P2fYPOVLtIV59abS7rrb6s0pImg3FB78
X-Google-Smtp-Source: APXvYqwXYECY5QYIKYlztS3Bw6N8um6jtDalK1khlT0nS84vFu+q+1zZgG/gvAAY6THtOhE425wHJMqvGSwg1eKRB2g=
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr16720717ljk.158.1561430544600;
	Mon, 24 Jun 2019 19:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190621185233.6766-1-casey@schaufler-ca.com>
	<20190621185233.6766-22-casey@schaufler-ca.com>
	<79cd4a92-c221-eda4-58ba-730b5c2680d7@canonical.com>
	<0ad8f906-16ff-61af-ce7c-0ea1e9760d03@schaufler-ca.com>
	<CAHC9VhSSwCY8L71x4WTr7kJhF1f_oyQ1NcwyXCAgW7ruKACQdQ@mail.gmail.com>
	<41f99313-1aa4-bacc-6767-8ee1389ca220@canonical.com>
In-Reply-To: <41f99313-1aa4-bacc-6767-8ee1389ca220@canonical.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Jun 2019 22:42:12 -0400
Message-ID: <CAHC9VhSSMjCdT8gfB03gh8VvJngTHnsUsDCpseMUiEPQM9z_FQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] Audit: Store LSM audit information in an lsmblob
To: John Johansen <john.johansen@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 25 Jun 2019 02:42:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 25 Jun 2019 02:42:35 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, James Morris <jmorris@namei.org>,
	casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 25 Jun 2019 02:43:44 +0000 (UTC)

On Mon, Jun 24, 2019 at 10:15 PM John Johansen
<john.johansen@canonical.com> wrote:
> On 6/24/19 6:46 PM, Paul Moore wrote:
> > On Mon, Jun 24, 2019 at 9:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 6/24/2019 2:33 PM, John Johansen wrote:
> >>> On 6/21/19 11:52 AM, Casey Schaufler wrote:
> >>>> Change the audit code to store full lsmblob data instead of
> >>>> a single u32 secid. This allows for multiple security modules
> >>>> to use the audit system at the same time. It also allows the
> >>>> removal of scaffolding code that was included during the
> >>>> revision of LSM interfaces.
> >>>>
> >>>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >>> I know Kees raised this too, but I haven't seen a reply
> >>>
> >>> Eric (Paul is already CCed): I have directly added you because of
> >>> the question below.
> >>>
> >>> In summary there isn't necessarily a single secid any more, and
> >>> we need to know whether dropping the logging of the secid or
> >>> logging all secids is the correct action.
> >>
> >> It is to be considered that this is an error case. If
> >> everything is working normally you should have produced
> >> a secctx previously, which you'll have included in the
> >> audit record. Including the secid in the record ought to
> >> be pointless, as the secid is strictly an internal token
> >> with no meaning outside the running kernel. You are providing
> >> no security relevant information by providing the secid.
> >> I will grant the possibility that the secid might be useful
> >> in debugging, but for that a pr_warn is more appropriate
> >> than a field in the audit record.
> >
> > FWIW, this probably should have been CC'd to the audit list.
> >
> hrmm indeed, sorry
>
> > I agree that this is an error case (security_secid_to_secctx() failed
> > to resolve the secid) and further that logging the secid, or a
> > collection of secids, has little value the way things currently work.
> > Since secids are a private kernel implementation detail, we don't
> > really display them outside the context of the kernel, including in
> > the audit logs.  Recording a secid in this case doesn't provide
> > anything meaningful since secids aren't recorded in the audit record
> > stream, only the secctxs, and there is no "magic decoder ring" to go
> > between the two in the audit logs, or anywhere else in userspace for
> > that matter.
>
> Okay, thanks. Casey I am good with just a pr_warn here. I just didn't
> have context of why it was going to the audit_log and didn't want
> to change that without some more input.

Hmm.  Actually, let me change my comments slightly ... perhaps what we
should do here is keep the audit_log_format(), but change it from
audit_log_format("osid=%u",...) to audit_log_format("obj=?").  The "?"
is used in audit when we can't determine a piece of information, but
we normally log it.  It wasn't used very widely originally, which is
probably why it isn't in this piece of code.

> >>>> ---
> >>>>  kernel/audit.h   |  6 +++---
> >>>>  kernel/auditsc.c | 38 +++++++++++---------------------------
> >>>>  2 files changed, 14 insertions(+), 30 deletions(-)
> >
> > ...
> >
> >>>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> >>>> index 0478680cd0a8..d3ad13f11788 100644
> >>>> --- a/kernel/auditsc.c
> >>>> +++ b/kernel/auditsc.c
> >>>> @@ -1187,21 +1184,18 @@ static void show_special(struct audit_context *context, int *call_panic)
> >>>>                              context->socketcall.args[i]);
> >>>>              break; }
> >>>>      case AUDIT_IPC: {
> >>>> -            u32 osid = context->ipc.osid;
> >>>> +            struct lsmblob *olsm = &context->ipc.olsm;
> >>>>
> >>>>              audit_log_format(ab, "ouid=%u ogid=%u mode=%#ho",
> >>>>                               from_kuid(&init_user_ns, context->ipc.uid),
> >>>>                               from_kgid(&init_user_ns, context->ipc.gid),
> >>>>                               context->ipc.mode);
> >>>> -            if (osid) {
> >>>> +            if (lsmblob_is_set(olsm)) {
> >>>>                      struct lsmcontext lsmcxt;
> >>>> -                    struct lsmblob blob;
> >>>>
> >>>> -                    lsmblob_init(&blob, osid);
> >>>> -                    if (security_secid_to_secctx(&blob, &lsmcxt)) {
> >>>> -                            audit_log_format(ab, " osid=%u", osid);
> >>> I am not comfortable just dropping this I would think logging all secids is the
> >>> correct action here.
> >>>
> >>>
> >>>> +                    if (security_secid_to_secctx(olsm, &lsmcxt))
> >>>>                              *call_panic = 1;
> >>>> -                    } else {
> >>>> +                    else {
> >>>>                              audit_log_format(ab, " obj=%s", lsmcxt.context);
> >>>>                              security_release_secctx(&lsmcxt);
> >>>>                      }

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
