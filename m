Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6CF829F25A
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 17:57:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ZJNKkasVPsiy58W7UDdlbg-1; Thu, 29 Oct 2020 12:57:39 -0400
X-MC-Unique: ZJNKkasVPsiy58W7UDdlbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2603A805F0C;
	Thu, 29 Oct 2020 16:57:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 054FA5C26A;
	Thu, 29 Oct 2020 16:57:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C67FD18199F6;
	Thu, 29 Oct 2020 16:57:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TGj9qb003412 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 12:45:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B24310F271D; Thu, 29 Oct 2020 16:45:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E9210F1C0D
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:45:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FEA189FEEB
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:45:06 +0000 (UTC)
Received: from out01.mta.xmission.com (out01.mta.xmission.com
	[166.70.13.231]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-oznUKoQ5NuWRAATO6HgCuw-1; Thu, 29 Oct 2020 12:44:57 -0400
X-MC-Unique: oznUKoQ5NuWRAATO6HgCuw-1
Received: from in01.mta.xmission.com ([166.70.13.51])
	by out01.mta.xmission.com with esmtps (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1kYB2Q-009eVE-Gs; Thu, 29 Oct 2020 10:44:34 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
	helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1kYB2N-0000rc-Un; Thu, 29 Oct 2020 10:44:34 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Tycho Andersen <tycho@tycho.pizza>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org> <20201029161231.GA108315@cisco>
Date: Thu, 29 Oct 2020 11:44:33 -0500
In-Reply-To: <20201029161231.GA108315@cisco> (Tycho Andersen's message of
	"Thu, 29 Oct 2020 10:12:31 -0600")
Message-ID: <87blglc77y.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1kYB2N-0000rc-Un; ; ; mid=<87blglc77y.fsf@x220.int.ebiederm.org>;
	; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
	frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18l/ky6v0TPp3RfG1uVSiI/idjNvZVspy0=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE, T_TM2_M_HEADER_IN_MSG, XMNoVowels autolearn=disabled
	version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  1.5 XMNoVowels Alpha-numberic number with no vowels
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: *;Tycho Andersen <tycho@tycho.pizza>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1948 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 11 (0.6%), b_tie_ro: 10 (0.5%), parse: 0.99
	(0.1%), extract_message_metadata: 15 (0.8%), get_uri_detail_list: 1.95
	(0.1%), tests_pri_-1000: 9 (0.5%), tests_pri_-950: 1.21 (0.1%),
	tests_pri_-900: 1.08 (0.1%), tests_pri_-90: 220 (11.3%), check_bayes:
	213 (10.9%), b_tokenize: 12 (0.6%), b_tok_get_all: 11 (0.5%),
	b_comp_prob: 3.1 (0.2%), b_tok_touch_all: 183 (9.4%), b_finish: 0.92
	(0.0%), tests_pri_0: 357 (18.3%), check_dkim_signature: 0.58 (0.0%),
	check_dkim_adsp: 2.7 (0.1%), poll_dns_idle: 1319 (67.7%),
	tests_pri_10: 2.1 (0.1%), tests_pri_500: 1327 (68.1%), rewrite_mail:
	0.00 (0.0%)
Subject: Re: [PATCH 00/34] fs: idmapped mounts
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:57:25 -0400
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Howells <dhowells@redhat.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Miklos Szeredi <miklos@szeredi.hu>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	selinux@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
	Forshee <seth.forshee@canonical.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Lennart Poettering <lennart@poettering.net>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	containers@lists.linux-foundation.org,
	Jonathan Corbet <corbet@lwn.net>, Seth,
	linux-unionfs@vger.kernel.org, David,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Alban Crequy <alban@kinvolk.io>, linux-integrity@vger.kernel.org,
	Todd Kjos <tkjos@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Tycho Andersen <tycho@tycho.pizza> writes:

> Hi Eric,
>
> On Thu, Oct 29, 2020 at 10:47:49AM -0500, Eric W. Biederman wrote:
>> Christian Brauner <christian.brauner@ubuntu.com> writes:
>> 
>> > Hey everyone,
>> >
>> > I vanished for a little while to focus on this work here so sorry for
>> > not being available by mail for a while.
>> >
>> > Since quite a long time we have issues with sharing mounts between
>> > multiple unprivileged containers with different id mappings, sharing a
>> > rootfs between multiple containers with different id mappings, and also
>> > sharing regular directories and filesystems between users with different
>> > uids and gids. The latter use-cases have become even more important with
>> > the availability and adoption of systemd-homed (cf. [1]) to implement
>> > portable home directories.
>> 
>> Can you walk us through the motivating use case?
>> 
>> As of this year's LPC I had the distinct impression that the primary use
>> case for such a feature was due to the RLIMIT_NPROC problem where two
>> containers with the same users still wanted different uid mappings to
>> the disk because the users were conflicting with each other because of
>> the per user rlimits.
>> 
>> Fixing rlimits is straight forward to implement, and easier to manage
>> for implementations and administrators.
>
> Our use case is to have the same directory exposed to several
> different containers which each have disjoint ID mappings.

Why do the you have disjoint ID mappings for the users that are writing
to disk with the same ID?

>> Reading up on systemd-homed it appears to be a way to have encrypted
>> home directories.  Those home directories can either be encrypted at the
>> fs or at the block level.  Those home directories appear to have the
>> goal of being luggable between systems.  If the systems in question
>> don't have common administration of uids and gids after lugging your
>> encrypted home directory to another system chowning the files is
>> required.
>> 
>> Is that the use case you are looking at removing the need for
>> systemd-homed to avoid chowning after lugging encrypted home directories
>> from one system to another?  Why would it be desirable to avoid the
>> chown?
>
> Not just systemd-homed, but LXD has to do this,

I asked why the same disk users are assigned different kuids and the
only reason I have heard that LXD does this is the RLIMIT_NPROC problem.

Perhaps there is another reason.

In part this is why I am eager to hear peoples use case, and why I was
trying very hard to make certain we get the requirements.

I want the real requirements though and some thought, not just we did
this and it hurts.  Changning the uids on write is a very hard problem,
and not just in implementating it but also in maintaining and
understanding what is going on.

Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

