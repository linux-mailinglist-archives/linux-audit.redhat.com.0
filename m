Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FD54F20
	for <lists+linux-audit@lfdr.de>; Tue, 25 Jun 2019 14:43:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11E1F3082E64;
	Tue, 25 Jun 2019 12:43:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6973019936;
	Tue, 25 Jun 2019 12:43:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED2AB4EBC9;
	Tue, 25 Jun 2019 12:42:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5P2F8LT015940 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 22:15:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 933FC6012C; Tue, 25 Jun 2019 02:15:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E838600CD;
	Tue, 25 Jun 2019 02:15:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DC63C18B2D6;
	Tue, 25 Jun 2019 02:14:54 +0000 (UTC)
Received: from static-50-53-46-226.bvtn.or.frontiernet.net ([50.53.46.226]
	helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <john.johansen@canonical.com>)
	id 1hfayv-0000UO-LF; Tue, 25 Jun 2019 02:14:49 +0000
Subject: Re: [PATCH v3 21/24] Audit: Store LSM audit information in an lsmblob
To: Paul Moore <paul@paul-moore.com>, Casey Schaufler <casey@schaufler-ca.com>
References: <20190621185233.6766-1-casey@schaufler-ca.com>
	<20190621185233.6766-22-casey@schaufler-ca.com>
	<79cd4a92-c221-eda4-58ba-730b5c2680d7@canonical.com>
	<0ad8f906-16ff-61af-ce7c-0ea1e9760d03@schaufler-ca.com>
	<CAHC9VhSSwCY8L71x4WTr7kJhF1f_oyQ1NcwyXCAgW7ruKACQdQ@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
	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
Organization: Canonical
Message-ID: <41f99313-1aa4-bacc-6767-8ee1389ca220@canonical.com>
Date: Mon, 24 Jun 2019 19:14:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSSwCY8L71x4WTr7kJhF1f_oyQ1NcwyXCAgW7ruKACQdQ@mail.gmail.com>
Content-Language: en-GB
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Tue, 25 Jun 2019 02:14:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 25 Jun 2019 02:14:58 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com' HELO:'youngberry.canonical.com'
	FROM:'john.johansen@canonical.com' RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com
	<john.johansen@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 08:42:36 -0400
Cc: selinux@vger.kernel.org, James Morris <jmorris@namei.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 25 Jun 2019 12:43:31 +0000 (UTC)

On 6/24/19 6:46 PM, Paul Moore wrote:
> On Mon, Jun 24, 2019 at 9:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 6/24/2019 2:33 PM, John Johansen wrote:
>>> On 6/21/19 11:52 AM, Casey Schaufler wrote:
>>>> Change the audit code to store full lsmblob data instead of
>>>> a single u32 secid. This allows for multiple security modules
>>>> to use the audit system at the same time. It also allows the
>>>> removal of scaffolding code that was included during the
>>>> revision of LSM interfaces.
>>>>
>>>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>>> I know Kees raised this too, but I haven't seen a reply
>>>
>>> Eric (Paul is already CCed): I have directly added you because of
>>> the question below.
>>>
>>> In summary there isn't necessarily a single secid any more, and
>>> we need to know whether dropping the logging of the secid or
>>> logging all secids is the correct action.
>>
>> It is to be considered that this is an error case. If
>> everything is working normally you should have produced
>> a secctx previously, which you'll have included in the
>> audit record. Including the secid in the record ought to
>> be pointless, as the secid is strictly an internal token
>> with no meaning outside the running kernel. You are providing
>> no security relevant information by providing the secid.
>> I will grant the possibility that the secid might be useful
>> in debugging, but for that a pr_warn is more appropriate
>> than a field in the audit record.
> 
> FWIW, this probably should have been CC'd to the audit list.
> 
hrmm indeed, sorry

> I agree that this is an error case (security_secid_to_secctx() failed
> to resolve the secid) and further that logging the secid, or a
> collection of secids, has little value the way things currently work.
> Since secids are a private kernel implementation detail, we don't
> really display them outside the context of the kernel, including in
> the audit logs.  Recording a secid in this case doesn't provide
> anything meaningful since secids aren't recorded in the audit record
> stream, only the secctxs, and there is no "magic decoder ring" to go
> between the two in the audit logs, or anywhere else in userspace for
> that matter.
> 
Okay, thanks. Casey I am good with just a pr_warn here. I just didn't
have context of why it was going to the audit_log and didn't want
to change that without some more input.


>>>> ---
>>>>  kernel/audit.h   |  6 +++---
>>>>  kernel/auditsc.c | 38 +++++++++++---------------------------
>>>>  2 files changed, 14 insertions(+), 30 deletions(-)
> 
> ...
> 
>>>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>>>> index 0478680cd0a8..d3ad13f11788 100644
>>>> --- a/kernel/auditsc.c
>>>> +++ b/kernel/auditsc.c
>>>> @@ -1187,21 +1184,18 @@ static void show_special(struct audit_context *context, int *call_panic)
>>>>                              context->socketcall.args[i]);
>>>>              break; }
>>>>      case AUDIT_IPC: {
>>>> -            u32 osid = context->ipc.osid;
>>>> +            struct lsmblob *olsm = &context->ipc.olsm;
>>>>
>>>>              audit_log_format(ab, "ouid=%u ogid=%u mode=%#ho",
>>>>                               from_kuid(&init_user_ns, context->ipc.uid),
>>>>                               from_kgid(&init_user_ns, context->ipc.gid),
>>>>                               context->ipc.mode);
>>>> -            if (osid) {
>>>> +            if (lsmblob_is_set(olsm)) {
>>>>                      struct lsmcontext lsmcxt;
>>>> -                    struct lsmblob blob;
>>>>
>>>> -                    lsmblob_init(&blob, osid);
>>>> -                    if (security_secid_to_secctx(&blob, &lsmcxt)) {
>>>> -                            audit_log_format(ab, " osid=%u", osid);
>>> I am not comfortable just dropping this I would think logging all secids is the
>>> correct action here.
>>>
>>>
>>>> +                    if (security_secid_to_secctx(olsm, &lsmcxt))
>>>>                              *call_panic = 1;
>>>> -                    } else {
>>>> +                    else {
>>>>                              audit_log_format(ab, " obj=%s", lsmcxt.context);
>>>>                              security_release_secctx(&lsmcxt);
>>>>                      }
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
