Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051B8C3A8
	for <lists+linux-audit@lfdr.de>; Tue, 13 Aug 2019 23:27:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A6523086268;
	Tue, 13 Aug 2019 21:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD22680483;
	Tue, 13 Aug 2019 21:27:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 898DB2551C;
	Tue, 13 Aug 2019 21:27:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DLRLVw022495 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 17:27:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E664F4516; Tue, 13 Aug 2019 21:27:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-22.phx2.redhat.com [10.3.112.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 950D31F2;
	Tue, 13 Aug 2019 21:27:13 +0000 (UTC)
Date: Tue, 13 Aug 2019 17:27:10 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Aaron Goidel <acgoide@tycho.nsa.gov>
Subject: Re: [Non-DoD Source] Re: [RFC PATCH v2] security, capability: pass
	object information to security_capable
Message-ID: <20190813212710.wimxgfunrijqwuqt@madcap2.tricolour.ca>
References: <20190801144313.1014-1-acgoide@tycho.nsa.gov>
	<CAHC9VhTSWiz45vh+M+sgu+ePwgFPZ4Mr8GmRZQjsGWQSzkjbLg@mail.gmail.com>
	<b79617aa-2b40-40bf-9f35-0f5be8e34d3f@tycho.nsa.gov>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b79617aa-2b40-40bf-9f35-0f5be8e34d3f@tycho.nsa.gov>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>, luto@amacapital.net,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	Serge Hallyn <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 13 Aug 2019 21:27:38 +0000 (UTC)

On 2019-08-13 11:01, Aaron Goidel wrote:
> On 8/8/19 12:30 PM, Paul Moore wrote:
> > On Thu, Aug 1, 2019 at 10:43 AM Aaron Goidel <acgoide@tycho.nsa.gov> wrote:
> > > From: Nicholas Franck <nhfran2@tycho.nsa.gov>
> > > 
> > > At present security_capable does not pass any object information
> > > and therefore can neither audit the particular object nor take it
> > > into account. Augment the security_capable interface to support
> > > passing supplementary data. Use this facility initially to convey
> > > the inode for capability checks relevant to inodes. This only
> > > addresses capable_wrt_inode_uidgid calls; other capability checks
> > > relevant to inodes will be addressed in subsequent changes. In the
> > > future, this will be further extended to pass object information for
> > > other capability checks such as the target task for CAP_KILL.
> > > 
> > > In SELinux this new information is leveraged here to include the inode
> > > in the audit message. In the future, it could also be used to perform
> > > a per inode capability checks.
> > > 
> > > It would be possible to fold the existing opts argument into this new
> > > supplementary data structure. This was omitted from this change to
> > > minimize changes.
> > > 
> > > Signed-off-by: Nicholas Franck <nhfran2@tycho.nsa.gov>
> > > Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
> > > ---
> > > v2:
> > > - Changed order of audit prints so optional information comes second
> > > ---
> > >   include/linux/capability.h             |  7 ++++++
> > >   include/linux/lsm_audit.h              |  5 +++-
> > >   include/linux/lsm_hooks.h              |  3 ++-
> > >   include/linux/security.h               | 23 +++++++++++++-----
> > >   kernel/capability.c                    | 33 ++++++++++++++++++--------
> > >   kernel/seccomp.c                       |  2 +-
> > >   security/apparmor/capability.c         |  8 ++++---
> > >   security/apparmor/include/capability.h |  4 +++-
> > >   security/apparmor/ipc.c                |  2 +-
> > >   security/apparmor/lsm.c                |  5 ++--
> > >   security/apparmor/resource.c           |  2 +-
> > >   security/commoncap.c                   | 11 +++++----
> > >   security/lsm_audit.c                   | 21 ++++++++++++++--
> > >   security/safesetid/lsm.c               |  3 ++-
> > >   security/security.c                    |  5 ++--
> > >   security/selinux/hooks.c               | 20 +++++++++-------
> > >   security/smack/smack_access.c          |  2 +-
> > >   17 files changed, 110 insertions(+), 46 deletions(-)
> > 
> > You should CC the linux-audit list, I've added them on this mail.
> > 
> > I had hoped to see some thought put into the idea of dynamically
> > emitting the proper audit records as I mentioned in the previous patch
> > set, but regardless there are some comments on this code as written
> > ...
> > 
> > > diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> > > index 33028c098ef3..18cc7c956b69 100644
> > > --- a/security/lsm_audit.c
> > > +++ b/security/lsm_audit.c
> > > @@ -229,9 +229,26 @@ static void dump_common_audit_data(struct audit_buffer *ab,
> > >          case LSM_AUDIT_DATA_IPC:
> > >                  audit_log_format(ab, " key=%d ", a->u.ipc_id);
> > >                  break;
> > > -       case LSM_AUDIT_DATA_CAP:
> > > -               audit_log_format(ab, " capability=%d ", a->u.cap);
> > > +       case LSM_AUDIT_DATA_CAP: {
> > > +               const struct inode *inode;
> > > +
> > > +               audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
> > > +               if (a->u.cap_struct.cad) {
> > > +                       switch (a->u.cap_struct.cad->type) {
> > > +                       case CAP_AUX_DATA_INODE: {
> > > +                               inode = a->u.cap_struct.cad->u.inode;
> > > +
> > > +                               audit_log_format(ab, " dev=");
> > > +                               audit_log_untrustedstring(ab,
> > > +                                       inode->i_sb->s_id);
> > > +                               audit_log_format(ab, " ino=%lu",
> > > +                                       inode->i_ino);
> > > +                               break;
> > > +                       }
> > 
> > Since you are declaring "inode" further up, there doesn't appear to be
> > any need for the CAP_AUX_DATA_INODE braces, please remove them.
> > 
> > The general recommended practice when it comes to "sometimes" fields
> > in an audit record, is to always record them in the record, but use a
> > value of "?" when there is nothing relevant to record.  For example,
> > when *not* recording inode information you would do something like the
> > following:
> > 
> >    audit_log_format(ab, " dev=? ino=?");
> > 
> The issue this brings up is what happens when this is expanded to more
> cases? Assuming there will be a case here for logging audit data for task
> based capabilities (CAP_AUX_DATA_TASK), what do we want to have happen if we
> are recording *neither* inode information nor task information (say a PID)?
> If we log something in the inode case, we presumably don't want to call
> audit_log_format(ab, " dev=?, pid=?") as well. (And vice versa for when we
> log a pid and no inode).

Yup.  This record is already a mess due to that.

The general solution is to either use a new record type for each
variant, or to use an auxiliary record for each additional piece of
information.  The long term solution that has been suggested it to move
away from a text message format.

> > > +                       }
> > > +               }
> > >                  break;
> > > +       }
> > >          case LSM_AUDIT_DATA_PATH: {
> > >                  struct inode *inode;
> 
> Aaron

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
